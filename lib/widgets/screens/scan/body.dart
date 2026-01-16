// lib/widgets/screens/scan/body.dart

import 'package:flutter/material.dart';
import 'package:trash_classifier/config.dart';
import 'package:trash_classifier/widgets/screens/scan/components/camera_preview.dart';
import 'package:trash_classifier/widgets/screens/scan/components/result_overlay.dart';
import 'package:trash_classifier/widgets/screens/scan/components/test_camera/test_camera_mode.dart';
import 'controller.dart';

class ScanBody extends StatelessWidget {
  final ScanController? controller;

  const ScanBody({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    if (AppConfig.isProd == false) {
      return const TestCameraMode();
    }

    if (controller == null ||
        controller!.cameraController == null ||
        !controller!.cameraController!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreviewWidget(cameraController: controller!.cameraController),
        const ResultOverlay(),
      ],
    );
  }
}