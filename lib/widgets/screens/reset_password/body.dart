import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/widgets/screens/reset_password/controller.dart';
import 'package:trash_classifier/widgets/screens/reset_password/validation.dart';

import '../../../blocks/reset_password/provider.dart';
import '../../../generated/l10n.dart';
import '../../../ui/colors.dart';
import '../../../ui/fonts.dart';
import '../../common/error_banner.dart';
import '../../common/filled_button.dart';
import '../../common/input.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    final provider = context.watch<ResetPasswordProvider>();

    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                $.pleaseEnterYourEmail,
                textAlign: TextAlign.center,
                style: AppFonts.buildCategoryDescription(
                    color: AppColors.primaryGrey
                ),
              ),
            ),
            const SizedBox(height: 16,),
            if (provider.error != null) ...[
              ErrorBanner(
                message: provider.error!,
              ),
            ],
            CInputField(
              controller: emailController,
              onChanged: (value) => provider.email = value,
              validator: (value) => ResetPasswordValidation.email(context, value),
              label: $.yourEmail,
              hint: '',
              obscureText: false,
            ),
            const SizedBox(height: 16,),
            provider.isLoading
                ? const CircularProgressIndicator(
              color: AppColors.primaryGreen,
              strokeWidth: 1.0,
            )
                : FilledAppButton(
              buttonName: $.resetPassword,
              onTap: () {
                ResetPasswordController.onTapReset(context, _formKey);
              },
            ),
          ],
        )
    );
  }
}
