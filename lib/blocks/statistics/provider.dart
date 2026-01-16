import 'package:flutter/material.dart';
import 'model.dart';
import 'repository.dart';

class StatisticsProvider extends ChangeNotifier {
  final StatisticsRepository _repository = StatisticsRepository();
  StatisticsModel _state = StatisticsModel.initial;

  StatisticsModel get state => _state;

  Future<void> loadStatistics(String userId, int periodIndex) async {
    if (userId.isEmpty) return;

    _state = _state.copyWith(isLoading: true, selectedPeriodIndex: periodIndex);
    notifyListeners();

    try {
      final processedData = await _repository.getGroupedStatistics(
        userId: userId,
        periodIndex: periodIndex,
      );

      if (_state.selectedPeriodIndex != periodIndex) return;

      _state = _state.copyWith(
          isLoading: false,
          chartData: processedData,
          errorMessage: null
      );
    } catch (e) {
      _state = _state.copyWith(isLoading: false, errorMessage: e.toString());
    }
    notifyListeners();
  }
}