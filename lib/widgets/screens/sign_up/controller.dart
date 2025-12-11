import 'package:flutter/material.dart';
import '../../../blocks/auth/provider.dart';

class SignUpController {
  final BuildContext context;
  final AuthProvider authProvider;

  SignUpController(this.context, this.authProvider);

  Future<void> register(String name, String email, String password) async {
    print('Registering user with: $email / $password');
    if (email.isEmpty || password.isEmpty) {
      print('ERROR: Email or password is empty!');
      return;
    }

    await authProvider.register(name, email, password);

    if (authProvider.user != null) {
      if(context.mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }
  }
}
