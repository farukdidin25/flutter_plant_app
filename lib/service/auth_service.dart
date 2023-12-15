import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final firebaseAuth = FirebaseAuth.instance;

  Future signInAnonymous() async {
    try {
      final result = await firebaseAuth.signInAnonymously();
      if (kDebugMode) {
        print(result.user!.uid);
      }
      return result.user;
    } catch (e) {
      if (kDebugMode) {
        print("Anon error $e");
      }
      return null;
    }
  }
}