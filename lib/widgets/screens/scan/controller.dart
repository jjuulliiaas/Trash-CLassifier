import 'package:camera/camera.dart';

import '../../../blocks/camera_controller/repository.dart';
import '../../../blocks/detection/provider.dart';
import '../../../blocks/detection_result/model.dart';
import '../../../helpers/image_helper.dart';
import '../../../services/tflite_service.dart';

class ScanController {
  final DetectionProvider detectionProvider;
  final TFLiteService tfLiteService;
  final ImageHelper imageHelper;
  final CameraRepository cameraRepo;

  bool _isProcessing = false;
  int _lastFrameTime = 0;
  final int frameIntervalMs;

  ScanController({
    required this.detectionProvider,
    required this.tfLiteService,
    required this.imageHelper,
    required this.cameraRepo,
    this.frameIntervalMs = 200,
  });

  CameraController? get cameraController => cameraRepo.cameraController;

  Future<void> initCamera(CameraDescription desc) async {
    await cameraRepo.initCamera(desc);
  }

  Future<void> startStream() async {
    if (!tfLiteService.isLoaded) {
      detectionProvider.setError('Model is not loaded');
      return;
    }

    if(cameraController == null || !cameraController!.value.isInitialized) {
      detectionProvider.setError('Camera is not initialized');
      return;
    }

    if (cameraRepo.isStreaming) return;

    await cameraRepo.startStream(_processFrame);
  }

  void _processFrame(CameraImage frame) async {

    if(!_canProcessFrame()) return;

    _isProcessing = true;
    _lastFrameTime = DateTime.now().millisecondsSinceEpoch;

    try {
      final input = imageHelper.preprocess(frame);
      final resultMap = await tfLiteService.runInference(input);

      final result = DetectionResultModel(
        label: resultMap['label'] as String,
        confidence: resultMap['confidence'] as double,
      );

      detectionProvider.setResult(result);
    } catch (e) {
      detectionProvider.setError(e.toString());
    } finally {
      _isProcessing = false;
    }
  }

  bool _canProcessFrame() {
    final now = DateTime.now().millisecondsSinceEpoch;
    return cameraController != null &&
        cameraController!.value.isInitialized &&
        cameraRepo.isStreaming &&
        !_isProcessing &&
        (now - _lastFrameTime >= frameIntervalMs);
  }

  Future<void> stopStream() async => cameraRepo.stopStream();

  Future<void> dispose() async {
    if(cameraRepo.isStreaming) await cameraRepo.stopStream();

    tfLiteService.close();
  }
}
