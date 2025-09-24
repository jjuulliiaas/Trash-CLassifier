import 'package:flutter/material.dart';
import 'package:trash_classifier/widgets/common/bottom_bar.dart';
import 'body.dart';

class AccountScreen extends StatelessWidget{
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AccountBody(),
      bottomNavigationBar: CBottomBar(currentIndex: 2,),
    );
  }
}