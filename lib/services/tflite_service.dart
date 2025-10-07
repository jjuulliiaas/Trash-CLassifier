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

  /// Getters

  bool get isLoaded => _interpreter != null && _labels!= null;
  List<String> get labels => _labels ?? [];

  Future<void> loadModel() async {
    if(_interpreter != null) return;

    _interpreter = await Interpreter.fromAsset(modelAssetPath);

    final rawLabels = await rootBundle.loadString(labelsAssetPath);
    _labels = rawLabels
        .split('\n')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
  }

  Future<Map<String, dynamic>> runInference(List<List<List<List<double>>>> input) async {
    if(!isLoaded) {
      throw Exception('Model is not loaded.');
    }

    final output = List.generate(1, (_) => List.filled(_labels!.length, 0.0));

    _interpreter!.run(input, output);

    final confidences = output[0];
    int maxIndex = 0;
    double maxConfidence = confidences[0];

    for(int i = 1; i < confidences.length; i++) {
      if(confidences[i] > maxConfidence) {
        maxIndex = i;
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
    if(_interpreter != null) {
      _interpreter!.close();
      _interpreter = null;
    }
  }

}