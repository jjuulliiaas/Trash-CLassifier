import 'package:flutter/material.dart';
import 'package:trash_classifier/widgets/common/bottom_bar.dart';
import 'package:trash_classifier/widgets/screens/home/body.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: const HomeBody(),
      bottomNavigationBar: CBottomBar(currentIndex: 0,),
    );
  }
}