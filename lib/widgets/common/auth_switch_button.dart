import 'package:flutter/material.dart';
import 'package:trash_classifier/ui/colors.dart';

import '../../ui/fonts.dart';

class AuthSwitchButton extends StatelessWidget {
  const AuthSwitchButton({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap
  });

  final String text;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppFonts.buildCategoryDescription(),
        ),
        TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              actionText,
              style: AppFonts.buildCategoryDescription(
                color: AppColors.primaryGreen
              ).copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryGreen,
                decorationThickness: 1.5,
              ),
            ),
        )
      ],
    );
  }
}
