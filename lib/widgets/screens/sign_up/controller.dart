import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/blocks/sign_up/provider.dart';
import '../../../blocks/auth/provider.dart';
import '../../../routes.dart';

class SignUpController {

  static Future<void> onTapSignUp(BuildContext context, GlobalKey<FormState> formKey) async {
    final signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final isValid = formKey.currentState!.validate();

    if(!isValid) return;

    signUpProvider.isLoading = true;
    signUpProvider.error = null;

    try {
      await authProvider.register(
          signUpProvider.name.trim(),
          signUpProvider.email.trim(),
          signUpProvider.password.trim()
      );

      if(authProvider.user != null && context.mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }

    } catch(e) {
      if(context.mounted) {
        signUpProvider.error = e.toString();
      }
    } finally {
      if(context.mounted) {
        signUpProvider.isLoading = false;
      }
    }
  }
}
