import '../../services/firestore_service.dart';
import '../trash_category/model.dart';

class StatisticsRepository {
  final FirestoreService _firestoreService = FirestoreService();

  Future<Map<TrashCategory, int>> getGroupedStatistics({
    required String userId,
    required int periodIndex,
  }) async {
    final now = DateTime.now();
    DateTime startDate;

    switch (periodIndex) {
      case 0: startDate = now.subtract(const Duration(days: 7)); break;
      case 1: startDate = now.subtract(const Duration(days: 30)); break;
      default: startDate = now.subtract(const Duration(days: 365));
    }

    final scans = await _firestoreService.getScansByDateRange(userId, startDate, now);

    final Map<TrashCategory, int> grouped = {};
    for (var scan in scans) {
      final category = categoryFromLabel(scan.trashCategory);
      grouped[category] = (grouped[category] ?? 0) + 1;
    }

    final sortedEntries = grouped.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Map<TrashCategory, int>.fromEntries(sortedEntries);
  }
}