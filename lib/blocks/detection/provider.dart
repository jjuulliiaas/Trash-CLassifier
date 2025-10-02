import 'package:flutter/material.dart';
import 'package:trash_classifier/blocks/detection/model.dart';

import '../detection_result/model.dart';

class DetectionProvider extends ChangeNotifier {
  DetectionModel _state = const DetectionModel();

  /// Getters & Setters
  DetectionModel get state => _state;

  void setLoading({bool loading = true}) {
    _state = _state.copyWith(isModelLoading: loading, errorMessage: null);
    notifyListeners();
  }

  void setLoaded({bool loaded = true, }) {
    _state = _state.copyWith(isModelLoading: false, isModelLoaded: loaded, errorMessage: null);
    notifyListeners();
  }

  void setResult(DetectionResultModel result, {int processingTimeMs = 0}) {
    _state = _state.copyWith(
      isModelLoading: false,
      isModelLoaded: true,
      label: result.label,
      confidence: result.confidence,
      errorMessage: null,
      lastProcessingTimeMs: processingTimeMs,
      processedFrameCount: _state.processedFrameCount + 1
    );
    notifyListeners();
  }

  void setError(String message) {
    _state = state.copyWith(
      isModelLoading: false,
      isModelLoaded: false,
      errorMessage: message
    );
    notifyListeners();
  }

  void setInitialState() {
    _state = const DetectionModel();
    notifyListeners();
  }
}