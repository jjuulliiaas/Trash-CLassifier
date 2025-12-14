import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/blocks/sign_up/provider.dart';
import 'package:trash_classifier/widgets/screens/sign_up/controller.dart';
import 'package:trash_classifier/widgets/screens/sign_up/validation.dart';

import '../../../generated/l10n.dart';
import '../../../routes.dart';
import '../../../ui/colors.dart';
import '../../common/auth_switch_button.dart';
import '../../common/filled_button.dart';
import '../../common/input.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    final provider = context.watch<SignUpProvider>();

    return Form(
      key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (provider.error != null) ...[
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    provider.error!,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              CInputField(
                controller: nameController,
                onChanged: (value) => provider.name = value,
                validator: (value) => SignUpValidation.name(context, value),
                label: $.yourName,
                hint: '',
                obscureText: false,
              ),
              const SizedBox(height: 16,),
              CInputField(
                controller: emailController,
                onChanged: (value) => provider.email = value,
                validator: (value) => SignUpValidation.email(context, value),
                label: $.yourEmail,
                hint: '',
                obscureText: false,
              ),
              const SizedBox(height: 16,),
              CInputField(
                controller: passwordController,
                onChanged: (value) => provider.password = value,
                validator: (value) => SignUpValidation.password(context, value),
                label: $.yourPassword,
                hint: '',
                obscureText: true,
              ),
              provider.isLoading
                  ? const CircularProgressIndicator(
                color: AppColors.primaryGreen,
                strokeWidth: 1.0,
              )
                  : FilledAppButton(
                buttonName: $.signUp,
                onTap: () {
                  SignUpController.onTapSignUp(context, _formKey);
                },
              ),
              AuthSwitchButton(
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                },
                text: $.alreadyHaveAccount,
                actionText: $.signIn,
              )
            ],
        )
    );
  }
}
