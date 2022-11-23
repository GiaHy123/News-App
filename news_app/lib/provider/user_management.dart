import 'package:flutter/foundation.dart';
import 'package:news_app/constants/collection.dart';
import 'package:news_app/firebase/auth.dart';
import 'package:news_app/firebase/cloud_firesotre.dart';
import 'package:news_app/models/user_info.dart';

class UserManagement with ChangeNotifier, DiagnosticableTreeMixin {

  final Auth _auth = Auth(); 

  UserInfo _user = UserInfo(id: '', name: 'Guest');
  UserInfo get user => _user;

  bool _loginSuccess = false;
  bool get loginSuccess => _loginSuccess;

  Future<void> checkLogin() async {
    _auth.auth.authStateChanges()
    .listen((event) {
        if(event != null){
          _loginSuccess = true;
          getUser(event.uid);
        }
        else{
          _loginSuccess = false;
        }
      });
  }
  Future<void> getUser(String uid) async {
    final data = await CloudFirestore().checkDataExists(Collection.users, uid);
    if(data.exists){
      _user = UserInfo.fromJson(data.data()!);
    }else{
      UserInfo userData = UserInfo(id: uid, name: '');
      userData.name = _auth.auth.currentUser?.displayName;
      userData.email = _auth.auth.currentUser?.email;
      userData.avatar = _auth.auth.currentUser?.photoURL;
      CloudFirestore().addData(Collection.users, uid, userData.toJson());
      _user = userData;
    }
    notifyListeners();
  }

  Future<void> loginWithGoogle () => _auth.signInWithGoogle().then((value) => _onStateChange());

  void logOut () => _auth.logOut().then((value) => _onStateChange());

  void _onStateChange () {
    _auth.auth.authStateChanges()
      .listen((event) {
        if(event != null){
          _loginSuccess = true;
          getUser(event.uid);
        }
        else{
          _loginSuccess = false;
        }
      });
      notifyListeners();
  }

}