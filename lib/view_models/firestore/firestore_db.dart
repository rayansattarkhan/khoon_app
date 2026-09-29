import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirestoreDb {
  static FirebaseFirestore fsDB = FirebaseFirestore.instance;

  /// Return 'true' on success and 'false' on failure.
  static Future<bool> addUserDocument(Map<String, dynamic> user) async {
    try {
      await fsDB.collection('users').add(user).then((DocumentReference doc) {
        if (kDebugMode){
          print('Document snapshot added with ID: ${doc.id}');
          return true;
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return false;
  }

  static Future<Map<dynamic, dynamic>?> readUserDocument() async {
    Map<dynamic, dynamic> userProfiles = <dynamic, dynamic>{};

    try {
      var users = await fsDB.collection('users').get();
      for (var doc in users.docs) {
        userProfiles[doc.id] = doc.data();
      }
      return userProfiles;
    } catch (e) {
      if(kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
