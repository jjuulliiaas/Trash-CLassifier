import 'package:cloud_firestore/cloud_firestore.dart';

class ScanResult {
  final String? id;
  final String userId;
  final String trashCategory; // label (e.g., "plastic")
  final double confidence;
  final DateTime date;

  ScanResult({
    this.id,
    required this.userId,
    required this.trashCategory,
    required this.confidence,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'trashCategory': trashCategory,
      'confidence': confidence,
      'date': Timestamp.fromDate(date),
    };
  }

  factory ScanResult.fromMap(Map<String, dynamic> map, String docId) {
    return ScanResult(
      id: docId,
      userId: map['userId'] ?? '',
      trashCategory: map['trashCategory'] ?? 'unknown',
      confidence: (map['confidence'] ?? 0.0).toDouble(),
      date: (map['date'] as Timestamp).toDate(),
    );
  }
}