import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  String _name = '';
  String _email = '';
  String _password = '';
  bool _isLoading = false;

  String? _error;

  /// Getters & Setters

  String get name => _name;
  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;

  String? get error => _error;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set password(String value) {
    _password = value;
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