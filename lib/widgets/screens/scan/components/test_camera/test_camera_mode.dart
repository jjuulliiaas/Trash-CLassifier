import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/blocks/test_mode/provider.dart';
import 'package:trash_classifier/helpers/image_helper.dart';
import 'package:trash_classifier/services/tflite_service.dart';
import 'package:trash_classifier/widgets/screens/scan/components/test_camera/controller.dart';

import '../../../../../helpers/test_images_path.dart';
import '../result_overlay.dart';

class TestCameraMode extends StatefulWidget {
  const TestCameraMode({super.key});

  @override
  State<TestCameraMode> createState() => _TestCameraModeState();
}

class _TestCameraModeState extends State<TestCameraMode> {
  late final TestCameraProvider _provider;
  late final TestCameraController _controller;

  @override
  void initState() {
    super.initState();
    _provider = TestCameraProvider();
    _controller = TestCameraController(
        imagesPath: testImages,
        tfLiteService: TFLiteService(),
        provider: _provider,
        imageHelper: ImageHelper()
    );
    _controller.init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _provider,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Consumer<TestCameraProvider> (
              builder: (context, provider, _) {
                final currentImage = _controller.imagesPath[provider.currentIndex];
                return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 1000),
                  child: Image.asset(
                    currentImage,
                    key: ValueKey(currentImage),
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
          ResultOverlay()
        ],
      ),
    );
  }
}
