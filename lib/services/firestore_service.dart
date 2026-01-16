import 'package:cloud_firestore/cloud_firestore.dart';

import '../blocks/scan_result/model.dart';
import '../blocks/user/model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(User user) async {
    await _db.collection('users').doc(user.uid).set(user.toMap());
  }

  Future<User?> getUser(String uid) async {
    try {
      final doc = await _db.collection('users').doc(uid).get();

      if(doc.exists && doc.data() != null) {
        return User.fromMap(doc.data()!);
      }
      return null;
    } catch(e) {
      print("ERROR in FirestoreService (Get): $e");
      rethrow;
    }
  }

  Future<List<String>> getTrashCategories() async {
    try {
      final snapshot = await _db.collection('categories').get();
      return snapshot.docs.map((doc) => doc.id).toList();
    } catch(e) {
      print("Error fetching categories: $e");
      return ['plastic', 'metal', 'glass'];
    }
  }

  Future<void> saveScan(ScanResult scan) async {
    try {
      await _db.collection('scans').add(scan.toMap());
      await _updateUserStats(scan.userId, scan.trashCategory);
    } catch (e) {
      print("Error saving scan: $e");
      rethrow;
    }
  }

  Future<void> _updateUserStats(String userId, String category) async {
    final userRef = _db.collection('users').doc(userId);
    final fieldKey = 'categoryStats.${category.toLowerCase()}';

    await userRef.update({
      fieldKey: FieldValue.increment(1),
    });
  }

  Future<List<ScanResult>> getScansByDateRange(String userId, DateTime start, DateTime end) async {
    try {
      final snapshot = await _db
          .collection('scans')
          .where('userId', isEqualTo: userId)
          .where('date', isGreaterThanOrEqualTo: start)
          .where('date', isLessThanOrEqualTo: end)
          .get();
      return snapshot.docs.map((doc) => ScanResult.fromMap(doc.data(), doc.id)).toList();

    } catch (e) {
      print("Error fetching stats: $e");
      return [];
    }
  }
}