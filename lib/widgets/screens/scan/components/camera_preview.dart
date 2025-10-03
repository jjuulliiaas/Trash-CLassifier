import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPreviewWidget extends StatelessWidget{
  const CameraPreviewWidget({super.key, required this.cameraController});

  final CameraController? cameraController;

  @override
  Widget build(BuildContext context) {
    return CameraPreview(cameraController!);
  }
}