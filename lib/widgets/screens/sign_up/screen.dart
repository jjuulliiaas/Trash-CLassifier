import 'package:flutter/material.dart';
import 'package:trash_classifier/widgets/common/bottom_bar.dart';
import '../../../generated/l10n.dart';
import '../../../ui/fonts.dart';
import 'body.dart';

class SignUpScreen extends StatelessWidget{
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          $.signUp,
          style: AppFonts.buildScreenHeading(),
        ),
        centerTitle: true,
      ),
      body: const SignUpBody(),
      bottomNavigationBar: CBottomBar(currentIndex: 0,),
    );
  }
}