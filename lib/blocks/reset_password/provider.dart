import 'package:flutter/material.dart';

class ResetPasswordProvider extends ChangeNotifier {
  String _email = '';
  bool _isLoading = false;

  String? _error;

  /// Getters & Setters

  String get email => _email;
  bool get isLoading => _isLoading;

  String? get error => _error;

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set error(String? value) {
    _error = value;
    notifyListeners();
  }

}