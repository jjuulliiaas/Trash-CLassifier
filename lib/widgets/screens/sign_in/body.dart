import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/ui/fonts.dart';
import 'package:trash_classifier/widgets/screens/sign_in/validation.dart';

import '../../../blocks/sign_in/provider.dart';
import '../../../generated/l10n.dart';
import '../../../routes.dart';
import '../../../ui/colors.dart';
import '../../common/auth_switch_button.dart';
import '../../common/error_banner.dart';
import '../../common/filled_button.dart';
import '../../common/input.dart';
import 'controller.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    final provider = context.watch<SignInProvider>();

    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (provider.error != null) ...[
              ErrorBanner(
                message: provider.error!,
              ),
            ],
            CInputField(
              controller: emailController,
              onChanged: (value) => provider.email = value,
              validator: (value) => SignInValidation.email(context, value),
              label: $.yourEmail,
              hint: '',
              obscureText: false,
            ),
            const SizedBox(height: 16,),
            CInputField(
              controller: passwordController,
              onChanged: (value) => provider.password = value,
              validator: (value) => SignInValidation.password(context, value),
              label: $.yourPassword,
              hint: '',
              obscureText: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.resetPassword);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(right: 16.0),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    $.forgotPassword,
                    style: AppFonts.buildCategoryDescription(color: AppColors.primaryGreen),
                  )
              ),
            ),
            provider.isLoading
                ? const CircularProgressIndicator(
              color: AppColors.primaryGreen,
              strokeWidth: 1.0,
            )
                : FilledAppButton(
              buttonName: $.signIn,
              onTap: () {
                SignInController.onTapSignIn(context, _formKey);
              },
            ),
            AuthSwitchButton(
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoutes.signUp);
              },
              text: $.alreadyHaveAccount,
              actionText: $.signUp,
            )
          ],
        )
    );
  }
}
