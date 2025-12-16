import 'package:trash_classifier/services/firestore_service.dart';

import '../../services/auth_service.dart';
import '../user/model.dart';

class AuthRepository {
  final AuthService _auth;
  final FirestoreService _firestoreService;

  AuthRepository(this._auth, this._firestoreService);

  Future<User> register(String name, String email, String password) async {
    final appUser = await _auth.signUp(email, password);

    await _auth.updateUserName(name);

    List<String> categories = await _firestoreService.getTrashCategories();

    if (categories.isEmpty) {
      categories = ['plastic', 'metal', 'glass'];
    }

    final Map<String, int> initialStats = {
      for (var category in categories) category: 0
    };

    final user = User(
        uid: appUser!.uid,
        name: name,
        email: email,
        createdAt: DateTime.now(),
        categoryStats: initialStats,
    );
    await _firestoreService.createUser(user);
    return user;
  }

  Future<User?> login(String email, String password) async {
    final appUser = await _auth.signIn(email, password);

    if (appUser == null) return null;

    return await _firestoreService.getUser(appUser.uid);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }


}