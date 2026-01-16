import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trash_classifier/ui/colors.dart';

import '../../../../../blocks/trash_category/model.dart';
import '../../../../../ui/extensions/category_extension.dart';

class StatisticsBarChart extends StatelessWidget {
  final Map<TrashCategory, int> chartData;
  final int periodKey;

  const StatisticsBarChart({super.key, required this.chartData, required this.periodKey});

  @override
  Widget build(BuildContext context) {
    final dataList = chartData.entries.toList();

    double maxVal = dataList.isEmpty ? 0 : dataList.first.value.toDouble();
    double maxY = maxVal == 0 ? 10 : maxVal * 1.3;

    return BarChart(
      key: ValueKey(periodKey),
      swapAnimationDuration: const Duration(milliseconds: 250),
      BarChartData(
        backgroundColor: Colors.transparent,
        alignment: BarChartAlignment.spaceAround,
        maxY: maxY,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: _buildTitles(context, dataList),
        barGroups: dataList.asMap().entries.map((e) {
          final category = e.value.key;
          return BarChartGroupData(
            x: e.key,
            barRods: [
              BarChartRodData(
                toY: e.value.value.toDouble(),
                color: category.labelColor,
                width: 15,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: maxY,
                    color: AppColors.primaryWhite.withOpacity(0.2)
                ),
              )
            ],
          );
        }).toList(),
      ),
    );
  }

  FlTitlesData _buildTitles(BuildContext context, List<MapEntry<TrashCategory, int>> data) {
    return FlTitlesData(
      show: true,
      topTitles: const AxisTitles(),
      rightTitles: const AxisTitles(),
      leftTitles: const AxisTitles(),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: (val, meta) {
            final index = val.toInt();
            if (index < 0 || index >= data.length) return const SizedBox();
            return Text(
              data[index].key.name(context).substring(0, 3),
              style: const TextStyle(color: AppColors.primaryWhite, fontSize: 10),
            );
          },
        ),
      ),
    );
  }
}