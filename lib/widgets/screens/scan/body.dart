import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/blocks/camera_controller/repository.dart';
import 'package:trash_classifier/blocks/detection/provider.dart';
import 'package:trash_classifier/config.dart';
import 'package:trash_classifier/widgets/screens/scan/components/test_camera/test_camera_mode.dart';

import '../../../helpers/image_helper.dart';
import '../../../services/tflite_service.dart';
import 'components/camera_preview.dart';
import 'components/result_overlay.dart';
import 'controller.dart';

class ScanBody extends StatefulWidget {
  const ScanBody({super.key});

  @override
  State<ScanBody> createState() => _ScanBodyState();
}

class _ScanBodyState extends State<ScanBody> {
  ScanController? _controller;
  bool _isInitializing = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
  }

  Future<void> _initialize() async {
    try {
      final tfliteService = TFLiteService();
      await tfliteService.loadModel();

      final detectionProvider = context.read<DetectionProvider>();

      final controller = ScanController(
        detectionProvider: detectionProvider,
        tfLiteService: tfliteService,
        imageHelper: ImageHelper(),
        cameraRepo: CameraRepository(),
      );

      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        await controller.initCamera(cameras.first);

        if (controller.cameraController!.value.isInitialized) {
          await controller.startStream();
          detectionProvider.setCameraReady(true);
        }
      } else {
        detectionProvider.setError('No cameras found');
      }

      if (!mounted) return;
      setState(() {
        _controller = controller;
        _isInitializing = false;
      });
    } catch (e) {
      if (!mounted) return;
      context.read<DetectionProvider>().setError('Camera init failed: $e');
      setState(() {
        _isInitializing = false;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _controller?.tfLiteService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final detectionProvider = context.watch<DetectionProvider>();

    if (AppConfig.isProd == false) {
      return const TestCameraMode();
    }

    if (_isInitializing || _controller?.cameraController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!_controller!.cameraController!.value.isInitialized) {
      return const Center(child: Text('Initializing camera...'));
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreviewWidget(cameraController: _controller!.cameraController),
        const ResultOverlay(),
      ],
    );
  }
}
