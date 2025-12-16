import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password) async {
    try {
      final cleanEmail = email.trim();
      final result = await _auth.createUserWithEmailAndPassword(
          email: cleanEmail,
          password: password
      );
      return result.user;
    } catch (e) {
      print("ERROR in AuthService (Sign Up): $e");
      rethrow;
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      final cleanEmail = email.trim();
      final result = await _auth.signInWithEmailAndPassword(
          email: cleanEmail,
          password: password
      );
      return result.user;
    } catch(e) {
      print("ERROR in AuthService (Sign In): $e");
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } catch (e) {
      print("ERROR in AuthService (Reset Password): $e");
      rethrow;
    }
  }
}