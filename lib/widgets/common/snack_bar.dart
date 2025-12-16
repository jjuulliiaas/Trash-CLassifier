import 'package:flutter/material.dart';
import 'package:trash_classifier/ui/colors.dart';
import 'package:trash_classifier/ui/fonts.dart';

class AppSnackBar {
  static void show(
      BuildContext context, {
        required String text,
        Color backgroundColor = AppColors.lightGreen,
        IconData icon = Icons.check_circle,
      }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: AppColors.primaryGreen),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: AppFonts.buildCategoryDescription(
                  color: AppColors.primaryGreen
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'OK',
          textColor: AppColors.primaryGreen,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
