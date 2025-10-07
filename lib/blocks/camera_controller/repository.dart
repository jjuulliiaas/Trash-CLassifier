import 'package:camera/camera.dart';

class CameraRepository {
  CameraController? _cameraController;
  bool _isStreaming = false;

  CameraController? get cameraController => _cameraController;
  bool get isCameraInit => _cameraController?.value.isInitialized ?? false;
  bool get isStreaming => _isStreaming;

  Future<void> initCamera(CameraDescription cameraDescription) async {
    _cameraController = CameraController(
        cameraDescription,
        ResolutionPreset.medium,
        enableAudio: false,
    );
    await _cameraController!.initialize();
  }

  Future<void> startStream(Function(CameraImage) onFrame) async {
    if(_cameraController == null || !isCameraInit) return;
    if(_isStreaming) return;

    _isStreaming = true;

    try {
      await _cameraController!.startImageStream((frame) {
        if (_cameraController!.value.isStreamingImages) {
          onFrame(frame);
        }
      });
    } catch (e) {
      _isStreaming = false;
      rethrow;
    }
  }

  Future<void> stopStream() async {
    if(_cameraController == null || !_isStreaming) return;
    try {
      await _cameraController!.stopImageStream();
    } finally {
      _isStreaming = false;
    }
  }

  Future<void> dispose() async {
    if (_isStreaming) await stopStream();
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      await _cameraController!.dispose();
    }
    _cameraController = null;
  }

}