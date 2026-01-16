import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/widgets/screens/home/components/statistics/peroid_toggle.dart';

import '../../../../../blocks/statistics/model.dart';
import '../../../../../blocks/statistics/provider.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../ui/colors.dart';
import '../../../../../ui/fonts.dart';
import 'bar_chart.dart';
import 'legend.dart';

class StatisticsCard extends StatefulWidget {
  const StatisticsCard({super.key});
  @override
  State<StatisticsCard> createState() => _StatisticsCardState();
}

class _StatisticsCardState extends State<StatisticsCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
      context.read<StatisticsProvider>().loadStatistics(uid, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StatisticsProvider>();
    final state = provider.state;
    final uid = FirebaseAuth.instance.currentUser?.uid ?? '';

    return Container(
      width: 400,
      height: 350,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  S.of(context).yourStatistics,
                  style: AppFonts.buildCategoryHeading(color: AppColors.primaryWhite)),
              PeriodToggleGroup(
                selectedIndex: state.selectedPeriodIndex,
                onSelected: (i) => provider.loadStatistics(uid, i),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(child: _buildBody(state)),
        ],
      ),
    );
  }

  Widget _buildBody(StatisticsModel state) {
    if (state.isLoading && state.chartData.isEmpty) {
      return const Center(
          child: CircularProgressIndicator(color: AppColors.primaryWhite));
    }

    if (state.chartData.isEmpty) {
      return Center(
          child: Text(
              S.of(context).noData,
              style: AppFonts.buildCategoryHeading(color: AppColors.primaryWhite),
          )
      );
    }

    return Stack(
      children: [
        Row(
          children: [
            Expanded(
                flex: 3,
                child: StatisticsBarChart(
                    chartData: state.chartData,
                    periodKey: state.selectedPeriodIndex
                )
            ),
            const SizedBox(width: 10),
            Expanded(flex: 2, child: StatisticsLegend(chartData: state.chartData)),
          ],
        ),
        if (state.isLoading)
          const Positioned(
            top: 0, right: 0,
            child: SizedBox(width: 15, height: 15, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primaryWhite)),
          ),
      ],
    );
  }
}