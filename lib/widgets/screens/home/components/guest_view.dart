import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../routes.dart';
import '../../../../ui/colors.dart';
import '../../../../ui/fonts.dart';
import '../../../common/filled_button.dart';

class HomeGuestView extends StatelessWidget {
  const HomeGuestView({super.key});

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            $.welcomeToTrashClassifier,
            textAlign: TextAlign.center,
            style: AppFonts.buildCategoryHeading(),
          ),
        ),

        Center(
          child: SizedBox(
            width: 300,
            height: 180,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primaryGrey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      Icons.lock_rounded,
                      size: 40,
                      color: AppColors.primaryGrey
                  ),
                  const SizedBox(height: 10),
                  Text(
                    $.statisticsUnavailable,
                    style: AppFonts.buildCategoryHeading(),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    $.signInToSeeYourResults,
                    textAlign: TextAlign.center,
                    style: AppFonts.buildCategoryDescription(
                        color: AppColors.primaryGrey
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Text(
                $.scanHistory,
                style: AppFonts.buildScreenHeading(
                    color: AppColors.primaryBlack
                ),
              ),
              const SizedBox(height: 10),
              Text(
                $.scanHistorySaveOnlyInAccount,
                textAlign: TextAlign.center,
                style: AppFonts.buildCategoryDescription(
                    color: AppColors.primaryGrey
                ),
              ),
              const SizedBox(height: 20),
              FilledAppButton(
                buttonName: '${$.signIn} / ${$.signUp}',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.signIn);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
