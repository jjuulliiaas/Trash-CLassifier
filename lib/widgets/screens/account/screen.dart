import 'package:flutter/material.dart';
import 'package:trash_classifier/widgets/common/bottom_bar.dart';
import '../../../generated/l10n.dart';
import '../../../ui/fonts.dart';
import 'body.dart';

class AccountScreen extends StatelessWidget{
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            $.accountScreenTitle,
          style: AppFonts.buildScreenHeading(),
        ),
        centerTitle: true,
      ),
      body: const AccountBody(),
      bottomNavigationBar: CBottomBar(currentIndex: 2,),
    );
  }
}