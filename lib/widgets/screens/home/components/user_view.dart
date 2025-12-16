import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../generated/l10n.dart';
import '../../../../ui/colors.dart';
import '../../../../ui/fonts.dart';

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
          child: SizedBox(
            width: 300,
            height: 180,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryGreen.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                      Icons.bar_chart,
                      color: AppColors.primaryWhite,
                      size: 40
                  ),
                  const SizedBox(height: 10),
                  Text(
                    $.yourStatistics,
                    style: AppFonts.buildCategoryHeading(
                        color: AppColors.primaryWhite
                    ),
                  ),
                  Text(
                    $.chartsWillBeHere,
                    style: AppFonts.buildCategoryDescription(
                        color: AppColors.primaryWhite
                    ),
                  ),
                ],
              ),
            ),
          ),
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
