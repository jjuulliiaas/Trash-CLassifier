import 'package:cloud_firestore/cloud_firestore.dart';

import '../blocks/user/model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(User user) async{
    await _db.collection('users').doc(user.uid).set(user.toMap());
  }
}