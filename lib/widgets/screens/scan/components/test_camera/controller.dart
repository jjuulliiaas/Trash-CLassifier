import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:trash_classifier/helpers/image_helper.dart';
import 'package:trash_classifier/services/tflite_service.dart';

import '../../../../../blocks/test_mode/provider.dart';

class TestCameraController {
  final TFLiteService tfLiteService;
  final List<String> imagesPath;
  final TestCameraProvider provider;
  final ImageHelper imageHelper;

  TestCameraController({
    required this.imagesPath,
    required this.tfLiteService,
    required this.provider,
    required this.imageHelper
});



  Future<void> init() async {
    await tfLiteService.loadModel();
    await Future.delayed(const Duration(milliseconds: 50));
    await _processCurrentImage();
  }

  Future<void> _processCurrentImage() async {

    if(provider.isProcessing) return;

    provider.setProcessing(true);

    try {
      final bytes = await rootBundle.load(imagesPath[provider.currentIndex]);
      final image = img.decodeImage(bytes.buffer.asUint8List());
      if (image == null) throw Exception('Cannot decode image');

      final input = imageHelper.preprocessFromImage(image);
      final result = await tfLiteService.runInference(input);

      provider.setResult(result['label'], result['confidence']);
    } catch (e) {
      provider.setError('Error: $e');
    } finally {
      provider.setProcessing(false);
    }

    await Future.delayed(const Duration(seconds: 5));
    provider.nextImage(imagesPath.length);
    _processCurrentImage();
  }

  void dispose() => tfLiteService.close();

}