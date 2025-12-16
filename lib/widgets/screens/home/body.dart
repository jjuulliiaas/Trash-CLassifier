import 'package:flutter/material.dart';
import 'package:trash_classifier/ui/colors.dart';

class HomeBody extends StatelessWidget{
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryGreen
              ),
              child: const Text('Statistic'),
            )
          )
        ),
        const SizedBox(height: 50,),
        const Text('Scan History'),
        const SizedBox(height: 50,),

      ],
    );
  }
}