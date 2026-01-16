import 'package:flutter/material.dart';
import 'package:trash_classifier/ui/colors.dart';
import 'package:trash_classifier/ui/fonts.dart';

import '../../../../../blocks/trash_category/model.dart';
import '../../../../../ui/extensions/category_extension.dart';

class StatisticsLegend extends StatelessWidget {
  final Map<TrashCategory, int> chartData;
  const StatisticsLegend({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: chartData.entries.map((e) {
          final category = e.key; // TrashCategory

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: category.labelColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    category.name(context),
                    style: AppFonts.buildCategoryDescription(color: AppColors.primaryWhite),
                  ),
                ),
                Text(
                  '${e.value}',
                  style: AppFonts.buildCategoryDescription(color: AppColors.primaryWhite),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}