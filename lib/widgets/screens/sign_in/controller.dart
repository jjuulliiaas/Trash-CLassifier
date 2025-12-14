import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/helpers/firebase_error_handler.dart';
import '../../../blocks/auth/provider.dart';

import '../../../blocks/sign_in/provider.dart';
import '../../../routes.dart';

class SignInController {

  static Future<void> onTapSignIn(BuildContext context, GlobalKey<FormState> formKey) async {
    final signInProvider = Provider.of<SignInProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final isValid = formKey.currentState!.validate();

    if(!isValid) return;

    signInProvider.isLoading = true;
    signInProvider.error = null;

    try {
      await authProvider.login(
        signInProvider.email.trim(),
        signInProvider.password.trim(),
      );

      if(authProvider.user != null && context.mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
    } catch(e) {
      if(context.mounted) {
        signInProvider.error = FirebaseErrorHandler.getMessage(context, e);
      }
    } finally {
      if(context.mounted) {
        signInProvider.isLoading = false;
      }
    }
  }
}