// A model of result of one detection.

class DetectionResultModel {
  final String label;
  final double confidence;

  const DetectionResultModel({
    required this.label,
    required this.confidence,
});

  // logs
  @override
  String toString() =>
      'DetectionResultModel(label: $label, confidence: ${(confidence * 100).toStringAsFixed(1)}%)';

  debugPrint() {
    toString();
  }

}