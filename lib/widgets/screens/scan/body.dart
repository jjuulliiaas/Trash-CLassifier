import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/blocks/camera_controller/repository.dart';
import 'package:trash_classifier/blocks/detection/provider.dart';

import '../../../helpers/image_helper.dart';
import '../../../services/tflite_service.dart';
import 'components/camera_preview.dart';
import 'controller.dart';

class ScanBody extends StatefulWidget {
  const ScanBody({super.key});

  @override
  State<ScanBody> createState() => _ScanBodyState();

}

class _ScanBodyState extends State<ScanBody> {
  late final ScanController _controller;
  bool _isCameraReady = false;

  @override
  void initState() {
    super.initState();

    _controller = ScanController(
      detectionProvider: context.read<DetectionProvider>(),
      tfLiteService: TFLiteService(),
      imageHelper: ImageHelper(),
      cameraRepo: CameraRepository(),
    );

    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        await _controller.initCamera(cameras.first);
        await _controller.startStream();
        setState(() {
          _isCameraReady = true;
        });
      }
    } catch (e) {
      _controller.detectionProvider.setError('Camera init failed: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraReady) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        Center(
          child: CameraPreviewWidget(
            cameraController: _controller.cameraController,
          ),
        ),
      ],
    );
  }
}
