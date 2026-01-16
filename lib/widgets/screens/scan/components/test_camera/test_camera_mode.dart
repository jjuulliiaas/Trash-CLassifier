import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/blocks/detection/provider.dart';
import 'package:trash_classifier/blocks/detection_result/model.dart';
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
  late final TestCameraProvider _testProvider;
  late final TestCameraController _controller;

  final Map<String, String> _imageCategories = {
    'test1.jpg': 'plastic',
    'test2.jpg': 'metal',
    'test3.jpg': 'glass',
    'test4.jpg': 'cardboard',
    'test5.jpg': 'biological',
    'test6.jpg': 'clothes',
    'test7.jpg': 'shoes',
    'test8.jpg': 'trash',
    'test9.jpg': 'battery',
    'test10.jpg': 'paper',
  };

  @override
  void initState() {
    super.initState();
    _testProvider = TestCameraProvider();

    _controller = TestCameraController(
        imagesPath: testImages,
        tfLiteService: TFLiteService(),
        provider: _testProvider,
        imageHelper: ImageHelper()
    );
    _controller.init();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncWithGlobalProvider();
    });

    _testProvider.addListener(_syncWithGlobalProvider);
  }

  void _syncWithGlobalProvider() {
    if (!mounted) return;

    final fullPath = _controller.imagesPath[_testProvider.currentIndex];

    final fileName = fullPath.split('/').last;

    final label = _imageCategories[fileName] ?? 'trash';

    context.read<DetectionProvider>().setResult(
        DetectionResultModel(
            label: label,
            confidence: 0.98
        )
    );
  }

  @override
  void dispose() {
    _testProvider.removeListener(_syncWithGlobalProvider);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _testProvider,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Consumer<TestCameraProvider> (
              builder: (context, provider, _) {
                final currentImage = _controller.imagesPath[provider.currentIndex];
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset(
                    currentImage,
                    key: ValueKey(currentImage),
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
          const ResultOverlay()
        ],
      ),
    );
  }
}