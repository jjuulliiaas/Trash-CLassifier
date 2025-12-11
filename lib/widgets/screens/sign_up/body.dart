import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/blocks/auth/provider.dart';
import 'package:trash_classifier/widgets/screens/sign_up/controller.dart';

import '../../../generated/l10n.dart';
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

  late final SignUpController controller;

  @override
  void initState() {
    super.initState();
    controller = SignUpController(context, context.read<AuthProvider>());
  }

  Future<void> _signUp() async {
    await controller.register(
        nameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim()
    );
    print('Sign Up successful');
  }

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    return Form(
      key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CInputField(
                controller: nameController,
                validator: (value) =>
                value == null || value.trim().isEmpty ? 'Enter your name' : null,
                label: $.yourName,
                hint: '',
                obscureText: false,
              ),
              const SizedBox(height: 16,),
              CInputField(
                controller: emailController,
                validator: null,
                label: $.yourEmail,
                hint: '',
                obscureText: false,
              ),
              const SizedBox(height: 16,),
              CInputField(
                controller: passwordController,
                validator: null,
                label: $.yourPassword,
                hint: '',
                obscureText: true,
              ),
              FilledAppButton(
                onTap: _signUp,
                buttonName: $.signUp,
              ),
              AuthSwitchButton(
                onTap: () {},
                text: $.alreadyHaveAccount,
                actionText: $.signIn,
              )
            ],
        )
    );
  }
}
