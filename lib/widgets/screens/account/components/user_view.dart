import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../generated/l10n.dart';
import '../../../../ui/colors.dart';
import '../../../../ui/fonts.dart';
import '../../../common/filled_button.dart';
import '../controller.dart';

class AccountUserView extends StatelessWidget {
  const AccountUserView({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    final name = user.displayName ?? $.user;
    final email = user.email ?? '';

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.lightGreen,
              child: Text(
                name.isNotEmpty ? name[0].toUpperCase() : $.u,
                style: AppFonts.buildCategoryHeading(
                    color: AppColors.primaryGreen
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              $.greeting(name),
              style: AppFonts.buildCategoryHeading(),
            ),
            const SizedBox(height: 8),
            Text(
              email,
              style: AppFonts.buildInputLabel(
                  color: AppColors.primaryGrey
              ),
            ),
            const SizedBox(height: 48),
            FilledAppButton(
              buttonName: $.exit,
              onTap: () => AccountController.onTapSignOut(context),
            ),
          ],
        ),
      ),
    );
  }
}
