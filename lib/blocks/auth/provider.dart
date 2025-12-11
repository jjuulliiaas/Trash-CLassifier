import 'package:flutter/material.dart';
import 'package:trash_classifier/blocks/auth/repository.dart';

import '../user/model.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthProvider(this._authRepository);

  User? user;
  bool isLoading = false;

  Future<void> register(String name, String email, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      user = await _authRepository.register(name, email, password);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

}