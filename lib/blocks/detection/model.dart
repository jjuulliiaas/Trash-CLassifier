import 'dart:core';

import 'package:trash_classifier/blocks/detection_result/model.dart';

class DetectionModel {
  final bool isModelLoading;
  final bool isModelLoaded;

  final String? label;
  final double? confidence;
  final String? errorMessage;

  final int lastProcessingTimeMs;
  final int  processedFrameCount;

  /// Constructor
  const DetectionModel({
      this.isModelLoading = false,
      this.isModelLoaded = false,
      this.label,
      this.confidence,
      this.errorMessage,
      this.lastProcessingTimeMs = 0,
      this.processedFrameCount = 0
});

  DetectionResultModel? getLastResult() {
    if(label != null && confidence != null) {
      DetectionResultModel(label: label!, confidence: confidence!);
    }
    return null;
  }

  DetectionModel copyWith({
    bool? isModelLoading,
    bool? isModelLoaded,
    String? label,
    double? confidence,
    String? errorMessage,
    int? lastProcessingTimeMs,
    int?  processedFrameCount,
}) {
    return DetectionModel(
        isModelLoading: isModelLoading ?? this.isModelLoading,
        isModelLoaded: isModelLoaded ?? this.isModelLoaded,
        label: label ?? this.label,
        confidence: confidence ?? this.confidence,
        errorMessage: errorMessage ?? this.errorMessage,
        lastProcessingTimeMs: lastProcessingTimeMs ?? this.lastProcessingTimeMs,
        processedFrameCount: processedFrameCount ?? this.processedFrameCount
    );
  }

  static const DetectionModel initial = DetectionModel();

}