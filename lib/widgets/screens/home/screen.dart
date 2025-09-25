import 'package:flutter/material.dart';
import 'package:trash_classifier/widgets/common/bottom_bar.dart';
import 'package:trash_classifier/widgets/screens/home/body.dart';
import '../../../generated/l10n.dart';
import '../../../ui/fonts.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            $.homeScreenTitle,
          style: AppFonts.buildScreenHeading(),
        ),
        centerTitle: true,
      ),
      body: const HomeBody(),
      bottomNavigationBar: CBottomBar(currentIndex: 0,),
    );
  }
}