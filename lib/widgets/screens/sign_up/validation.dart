import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class SignUpValidation {

  static String? name(BuildContext context, String? value) {
    final $ = S.of(context);

    if(value == null || value.trim().isEmpty) {
      return $.isRequired;
    }

    return null;
  }

  static String? email(BuildContext context, String? value) {
    final $ = S.of(context);

    if(value == null || value.trim().isEmpty) {
      return $.isRequired;
    }

    final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value)) {
      return $.invalidEmail;
    }

    return null;
  }

  static String? password(BuildContext context, String? value) {
    final $ = S.of(context);

    if(value == null || value.trim().isEmpty) {
      return $.isRequired;
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }

    return null;
  }
}