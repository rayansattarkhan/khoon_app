import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseUser {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static late UserCredential? _credential;
  static bool _signInStatus = false;
  static bool _loggedOut = false;

  static Future<bool> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      _credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _signInStatus = true;
      return _signInStatus;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _signInStatus = false;
      return _signInStatus;
    }
  }

  static Future<bool> signInUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      _credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _signInStatus = true;
      return _signInStatus;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.code);
        print(e.message);
      }
      _signInStatus = false;
      return _signInStatus;
    }
  }

  static Future<bool> signOutUser() async {
    try {
      await _auth.signOut();
      if (_credential != null && _signInStatus == true) {
        _credential = null;
        _signInStatus = false;
        _loggedOut = true;
      }
      return _loggedOut;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.code);
      }
      _loggedOut = false;
      return _loggedOut;
    }
  }
}
