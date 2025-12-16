import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class SignInValidation {

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

    return null;
  }
}