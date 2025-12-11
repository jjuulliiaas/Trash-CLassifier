import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final DateTime createdAt;
  final Map<String, int> categoryStats;

  User({
    required this.uid,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.categoryStats
});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'createdAt': createdAt,
      'categoryStats': categoryStats
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    DateTime parsedDate;

    if(map['createdAt'] is Timestamp) {
      parsedDate = (map['createdAt'] as Timestamp).toDate();
    } else if (map['createdAt'] is String) {
      parsedDate = DateTime.tryParse(map['createdAt']) ?? DateTime.now();
    } else {
      parsedDate = DateTime.now();
    }

    return User(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      createdAt: parsedDate,
      categoryStats: Map<String, int>.from(map['categoryStats'] ?? {}),
    );
  }
}