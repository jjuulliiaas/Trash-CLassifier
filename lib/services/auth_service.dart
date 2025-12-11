import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password) async {
    print("--- DEBUG START ---");
    print("Raw email: '$email'");

    // 1. Видаляємо ВСІ пробіли та невидимі символи (RegExp)
    final cleanEmail = email.replaceAll(RegExp(r'\s+'), '').trim();

    print("Clean email: '$cleanEmail'");
    print("Length: ${cleanEmail.length}"); // Перевіряємо довжину

    // Перевірка "на око": julia@gmail.com має 15 символів.
    // Якщо покаже 16 або більше - там є прихований символ!

    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: cleanEmail,
          password: password
      );
      print('User created: ${result.user?.uid}');
      return result.user;
    } catch (e) {
      print("ERROR in AuthService: $e");
      rethrow;
    }
  }

  // Future<User?> signUp(String email, String password) async {
  //   final cleanEmail = email.trim();
  //
  //   final result = await _auth.createUserWithEmailAndPassword(
  //       email: cleanEmail,
  //       password: password
  //   );
  //   print('User created: ${result.user?.uid}');
  //   return result.user;
  // }
}