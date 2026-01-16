import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trash_classifier/widgets/screens/home/components/statistics/statistics_card.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../ui/colors.dart';
import '../../../../../ui/fonts.dart';

class HomeUserView extends StatelessWidget {
  const HomeUserView({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    final name = user.displayName ?? $.friend;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(height: 20),

        Text(
          $.greeting(name),
          style: AppFonts.buildCategoryHeading(),
        ),

        Center(
          child: StatisticsCard(),
        ),

        Column(
          children: [
            Text(
              $.scanHistory,
              style: AppFonts.buildScreenHeading(
                  color: AppColors.primaryBlack
              ),
            ),
            const SizedBox(height: 10),
            Text(
              $.lastScansWillBeHere,
              style: AppFonts.buildCategoryDescription(
                  color: AppColors.primaryGrey
              ),
            ),
          ],
        ),
        const SizedBox(height: 50,),
      ],
    );
  }
}
