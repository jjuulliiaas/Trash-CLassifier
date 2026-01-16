import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../ui/colors.dart';
import '../../../../../ui/fonts.dart';

class PeriodToggleGroup extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onSelected;

  const PeriodToggleGroup({super.key, required this.selectedIndex, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final $ = S.of(context);

    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryWhite.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(2),
      child: Row(
        children: List.generate(3, (index) {
          final labels = [$.w, $.m, $.y];
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onSelected(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryWhite : AppColors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                  labels[index],
                  style: AppFonts.buildCategoryDescription(
                    color: isSelected ? AppColors.primaryGreen : AppColors.primaryWhite,
                  )
              ),
            ),
          );
        }),
      ),
    );
  }
}