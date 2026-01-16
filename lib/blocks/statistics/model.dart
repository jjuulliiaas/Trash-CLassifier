import '../trash_category/model.dart';

class StatisticsModel {
  final bool isLoading;
  final Map<TrashCategory, int> chartData;
  final int selectedPeriodIndex;
  final String? errorMessage;

  const StatisticsModel({
    this.isLoading = false,
    this.chartData = const {},
    this.selectedPeriodIndex = 0,
    this.errorMessage
});

  StatisticsModel copyWith({
    bool? isLoading,
    Map<TrashCategory, int>? chartData,
    int? selectedPeriodIndex,
    String? errorMessage,
}) {
    return StatisticsModel(
      isLoading: isLoading ?? this.isLoading,
      chartData: chartData ?? this.chartData,
      selectedPeriodIndex: selectedPeriodIndex ?? this.selectedPeriodIndex,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  static const StatisticsModel initial = StatisticsModel();
}