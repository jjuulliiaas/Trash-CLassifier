import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../blocks/reset_password/provider.dart';
import '../../../generated/l10n.dart';
import '../../../ui/fonts.dart';
import 'body.dart';

class ResetPasswordScreen extends StatelessWidget{
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    return ChangeNotifierProvider(
      create: (_) => ResetPasswordProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            $.resetPassword,
            style: AppFonts.buildScreenHeading(),
          ),
          centerTitle: true,
        ),
        body: ResetPasswordBody(),
      ),
    );
  }
}