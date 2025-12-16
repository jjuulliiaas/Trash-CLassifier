import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../ui/colors.dart';
import '../../../../ui/fonts.dart';
import '../../../common/auth_switch_button.dart';
import '../../../common/filled_button.dart';
import '../controller.dart';

class AccountGuestView extends StatelessWidget {
  const AccountGuestView({super.key});

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                Icons.analytics_outlined,
                size: 80,
                color: AppColors.primarySaladColor
            ),
            const SizedBox(height: 24),

            Text(
              $.openMoreOpportunities,
              textAlign: TextAlign.center,
              style: AppFonts.buildCategoryHeading(),
            ),
            const SizedBox(height: 16),
            Text(
              $.createAccountForSavingScans,
              textAlign: TextAlign.center,
              style: AppFonts.buildCategoryDescription(
                  color: AppColors.primaryGrey
              ),
            ),
            const SizedBox(height: 32),
            FilledAppButton(
              buttonName: $.createAccount,
              onTap: () => AccountController.navigateToSignUp(context),
            ),
            const SizedBox(height: 16),
            AuthSwitchButton(
              onTap: () => AccountController.navigateToSignIn(context),
              text: $.alreadyHaveAccount,
              actionText: $.signIn,
            )
          ],
        ),
      ),
    );
  }
}

