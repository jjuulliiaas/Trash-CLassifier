import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/helpers/firebase_error_handler.dart';

import '../../../blocks/auth/provider.dart';
import '../../../blocks/reset_password/provider.dart';
import '../../../generated/l10n.dart';
import '../../common/snack_bar.dart';

class ResetPasswordController {
  static Future<void> onTapReset(BuildContext context, GlobalKey<FormState> formKey) async {
    final resetPasswordProvider = Provider.of<ResetPasswordProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final $ = S.of(context);

    final isValid = formKey.currentState!.validate();

    if(!isValid) return;

    resetPasswordProvider.isLoading = true;
    resetPasswordProvider.error = null;

    try {
      await authProvider.resetPassword(resetPasswordProvider.email.trim());

      if(context.mounted) {
        AppSnackBar.show(
            context,
            text: $.emailSendSuccessfully,
        );

        resetPasswordProvider.error = null;
      }
    } catch(e) {
      resetPasswordProvider.error = FirebaseErrorHandler.getMessage(context, e);
    } finally {
      if(context.mounted) {
        resetPasswordProvider.isLoading = false;
      }
    }
  }
}