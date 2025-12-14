import 'package:cloud_firestore/cloud_firestore.dart';

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
}