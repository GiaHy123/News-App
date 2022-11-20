import 'package:flutter/foundation.dart';
import 'package:news_app/firebase/auth.dart';
import 'package:news_app/models/user_info.dart';

class UserManagement with ChangeNotifier, DiagnosticableTreeMixin {

  final Auth _auth = Auth(); 

  final UserInfo _user = UserInfo(id: '', name: 'UserName');
  UserInfo get user => _user;

  bool _loginSuccess = false;
  bool get loginSuccess => _loginSuccess;


  Future<void> loginWithGoogle () => _auth.signInWithGoogle().then((value) => _onStateChange());

  void logOut () => _auth.logOut().then((value) => _onStateChange());

  void _getUserInfo (data) {
    _user.name = data?.displayName;
    _user.id = data?.uid;
    _user.email = data?.email;
    notifyListeners();
  }

  void _onStateChange () {
    _auth.auth.authStateChanges()
      .listen((event) {
        if(event != null){
          _loginSuccess = true;
          _getUserInfo(event);
        }
        else{
          _loginSuccess = false;
        }
      });
    notifyListeners();
  }

}