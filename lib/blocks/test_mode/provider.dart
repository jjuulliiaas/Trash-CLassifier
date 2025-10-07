import 'package:flutter/cupertino.dart';

class TestCameraProvider extends ChangeNotifier {
  bool _isProcessing = false;
  String? _label;
  double? _confidence;
  int _currentIndex = 0;

  /// Getters & Setters

  int get currentIndex => _currentIndex;
  bool get isProcessing => _isProcessing;
  String? get label => _label;
  double? get confidence => _confidence;

  void setProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  void setResult(String label, double confidence) {
    _label = label;
    _confidence = confidence;
    notifyListeners();
  }

  void setError(String message) {
    _label = message;
    _confidence = null;
    notifyListeners();
  }

  void nextImage(int totalImages) {
    _currentIndex = (_currentIndex + 1) % totalImages;
    notifyListeners();
  }
}