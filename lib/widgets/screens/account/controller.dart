import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../blocks/auth/provider.dart';
import '../../../routes.dart';

class AccountController {
  static Future<void> onTapSignOut(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      await authProvider.logout();
      if (context.mounted) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    } catch(e) {
      print("Error signing out: $e");
    }
  }

  static void navigateToSignIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signIn);
  }

  static void navigateToSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUp);
  }
}