import 'package:flutter/material.dart';

import '../../ui/colors.dart';
import '../../ui/fonts.dart';

class ErrorBanner extends StatelessWidget {
  final String message;

  const ErrorBanner({
    super.key,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.lightRed,
        borderRadius: BorderRadius.circular(90),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.error_outlined,
            color: AppColors.primaryRed,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: AppFonts.buildInputLabel(
                color: AppColors.primaryRed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}