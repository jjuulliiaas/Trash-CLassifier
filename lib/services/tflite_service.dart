// A skeleton for working with TensorFlow model

import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class TFLiteService {
  final String modelAssetPath;
  final String labelsAssetPath;

  Interpreter? _interpreter;
  List<String>? _labels;

  TFLiteService({
    this.modelAssetPath = 'assets/model/trash_classifier.tflite',
    this.labelsAssetPath = 'assets/model/labels.txt',
  });

  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset(modelAssetPath);
    final rawLabels = await rootBundle.loadString(labelsAssetPath);
    _labels = rawLabels
        .split('\n')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty).toList();
  }

  /// Getters

  bool get isLoaded => _interpreter != null && _labels!= null;
  List<String> get labels => _labels ?? [];

  Future<Map<String, dynamic>> runInference(List input) async {
    if(!isLoaded) {
      throw Exception('Model is not loaded.');
    }
    final output = List.filled(_labels!.length, 0.0).reshape([1, _labels!.length]);

    _interpreter!.run(input, output);

    final confidences = output[0] as List;
    int maxIndex = 0;
    double maxConfidence = confidences[0];

    for(int i = 1; i < confidences.length; i++) {
      if(confidences[i] > maxConfidence) {
        maxIndex++;
        maxConfidence = confidences[i];
      }
    }

    return {
      'label': _labels![maxIndex],
      'confidence': maxConfidence,
      'allConfidences': confidences
    };
  }

  void close() {
    _interpreter!.close();
    _interpreter = null;
  }

}