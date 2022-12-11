// ignore_for_file: unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/constants/collection.dart';
import 'package:news_app/firebase/auth.dart';
import 'package:news_app/firebase/cloud_firesotre.dart';
import 'package:news_app/models/user_info_db.dart';

class UserManagement with ChangeNotifier, DiagnosticableTreeMixin {
  final Auth _auth = Auth();

  UserInfoDB _user = UserInfoDB(id: '', name: 'Guest');
  UserInfoDB get user => _user;

  bool _loginSuccess = false;
  bool get loginSuccess => _loginSuccess;

  Future<void> checkLogin() async {
    _auth.auth.authStateChanges().listen((event) {
      if (event != null) {
        _loginSuccess = true;
        getUser(event.uid);
      } else {
        _loginSuccess = false;
      }
    });
  }

  Future<void> getUser(String uid) async {
    final data = await CloudFirestore().checkDataExists(Collection.users, uid);
    if (data.exists) {
      _user = UserInfoDB.fromJson(data.data()!);
    } else {
      UserInfoDB userData = UserInfoDB(id: uid, name: '');
      userData.name = _auth.auth.currentUser?.displayName ?? 'Guest';
      userData.email = _auth.auth.currentUser?.email ?? '';
      CloudFirestore().addData(Collection.users, uid, userData.toJson());
      _user = userData;
    }
    notifyListeners();
  }

  Future<void> updateUser() async {
    CloudFirestore()
        .updateData(Collection.users, _user.id.toString(), _user.toJson());
    notifyListeners();
  }

  Future<void> loginWithGoogle() =>
      _auth.signInWithGoogle().then((value) => _onStateChange());
  Future<void> loginWithAnonymous() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously().then((value) => _onStateChange());
      print("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }

  void logOut() => _auth.logOut().then((value) => _onStateChange());

  void _onStateChange() {
    _auth.auth.authStateChanges().listen((event) {
      if (event != null) {
        _loginSuccess = true;
        getUser(event.uid);
      } else {
        _user = UserInfoDB(id: '', name: 'Guest');
        _loginSuccess = false;
      }
    });
    notifyListeners();
  }
}
