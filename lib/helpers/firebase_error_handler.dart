import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class FirebaseErrorHandler {
  static String getMessage(BuildContext context, Object error) {
    final $ = S.of(context);

    if(error is FirebaseAuthException) {
      switch (error.code) {
      // Sign In errors
        case 'user-not-found':
          return $.errorUserNotFound;
        case 'wrong-password':
          return $.errorWrongPassword;
        case 'invalid-credential':
          return $.errorUserNotFound;

      // Sign Up errors
        case 'email-already-in-use':
          return $.errorEmailAlreadyInUse;
        case 'weak-password':
          return $.errorWeakPassword;
        case 'invalid-email':
          return $.errorInvalidEmail;

        default:
          return '${$.errorUnknown}: ${error.message}';
      }
    }

    return $.errorUnknown;
  }
}