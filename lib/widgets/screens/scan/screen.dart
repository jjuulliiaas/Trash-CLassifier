import 'package:flutter/material.dart';
import 'package:trash_classifier/widgets/common/bottom_bar.dart';
import 'body.dart';

class ScanScreen extends StatelessWidget{
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ScanBody(),
      bottomNavigationBar: CBottomBar(currentIndex: 1,),
    );
  }
}