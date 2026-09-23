import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseUser {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static bool _signIn = false;

  static Future<bool> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((_) {
            _signIn = true;
          });
      return _signIn;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _signIn = false;
      return _signIn;
    }
  }

  static Future<bool> signInUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((_) {
            _signIn = true;
          });
      return _signIn;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.code);
        print(e.message);
      }
      _signIn = false;
      return _signIn;
    }
  }

  static Future<bool> signOutUser() async {
    try {
      if (_signIn) {
        await _auth.signOut().then((_) {
          _signIn = false;
        });
      }
      return _signIn; // false as SignedOut
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.code);
      }
      return _signIn; // return signIn = True
    }
  }
}
