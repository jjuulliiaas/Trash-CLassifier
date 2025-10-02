import 'package:camera/camera.dart';
import 'package:trash_classifier/blocks/detection/provider.dart';
import 'package:trash_classifier/blocks/detection_result/model.dart';
import 'package:trash_classifier/helpers/image_helper.dart';
import 'package:trash_classifier/services/tflite_service.dart';

class CameraRepository {
  final DetectionProvider? detectionProvider;
  final TFLiteService tfLiteService;
  final ImageHelper? imageHelper;

  CameraController? _cameraController;
  bool _isProcessing = false;
  bool _isStreaming = false;

  CameraRepository({
    required this.detectionProvider,
    required this.tfLiteService,
    required this.imageHelper,
});

  CameraController? get cameraController => _cameraController;
  bool get isCameraInit => _cameraController?.value.isInitialized ?? false;
  bool get isStreaming => _isStreaming;

  Future<void> initCamera(CameraDescription cameraDescription) async {
    _cameraController = CameraController(
        cameraDescription,
        ResolutionPreset.medium,
        enableAudio: false
    );

    await _cameraController!.initialize();


  }

  Future<void> startImageStream() async {
    if(_cameraController == null || !isCameraInit) return;
    if(_isStreaming) return;
    if(!tfLiteService.isLoaded) {
      detectionProvider?.setError('Model is not loaded');
      return;
    }

    _isStreaming = true;

    await _cameraController!.startImageStream(_processCameraImage);
  }

  Future<void> stopImageStream() async {
    if(_cameraController == null || !_isStreaming) return;

    try {
      await _cameraController!.stopImageStream();
    } catch(e) {
      detectionProvider?.setError(e.toString());
    } finally {
      _isProcessing = false;
      _isStreaming = false;
    }
  }

  Future<void> dispose() async {
    await stopImageStream();
    await _cameraController?.dispose();
    _cameraController = null;
  }

  Future<void> _processCameraImage(CameraImage frame) async {
    if(_isProcessing) return;

    try {
      final input = imageHelper?.preprocess(frame);
      final resultMap = await tfLiteService.runInference(input!);

      final result = DetectionResultModel(
          label: resultMap['label'] as String,
          confidence: resultMap['confidence'] as double
      );

      detectionProvider?.setResult(result);
    } catch(e) {
      detectionProvider?.setError(e.toString());
    } finally {
      _isProcessing = false;
    }

  }

}