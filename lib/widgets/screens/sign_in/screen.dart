import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/widgets/common/bottom_bar.dart';
import '../../../blocks/sign_in/provider.dart';
import '../../../generated/l10n.dart';
import '../../../ui/fonts.dart';
import 'body.dart';

class SignInScreen extends StatelessWidget{
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    return ChangeNotifierProvider(
      create: (_) => SignInProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            $.signIn,
            style: AppFonts.buildScreenHeading(),
          ),
          centerTitle: true,
        ),
        body: SignInBody(),
        bottomNavigationBar: CBottomBar(currentIndex: 0,),
      ),
    );
  }
}