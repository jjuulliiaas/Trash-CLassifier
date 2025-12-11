import 'package:flutter/material.dart';

import '../../../routes.dart';
import '../../common/filled_button.dart';

class AccountBody extends StatelessWidget{
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledAppButton(
          onTap: () {
            Navigator.pushReplacementNamed(
                context,
                AppRoutes.signUp
            );
          },
          buttonName: 'Sign Up Page here ->',
        )
      ],
    );
  }
}