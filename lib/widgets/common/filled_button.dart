import 'package:flutter/material.dart';
import 'package:trash_classifier/ui/fonts.dart';

import '../../ui/colors.dart';


class FilledAppButton extends StatelessWidget {
  const FilledAppButton({
    super.key,
    required this.onTap,
    required this.buttonName
  });

  final String buttonName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryGreen,
            foregroundColor: AppColors.primaryWhite,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90),
            ),
          ),
          child: Text(
            buttonName,
            style: AppFonts.buildInputLabel(
              color: AppColors.primaryWhite
            ),
          ),
        ),
      ),
    );
  }
}
