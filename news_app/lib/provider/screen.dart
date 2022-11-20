import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/home/home.dart';
import 'package:news_app/screens/profile/authenticate.dart';
import 'package:news_app/screens/search/search.dart';
import 'package:news_app/screens/setting/setting.dart';


class Screen with ChangeNotifier, DiagnosticableTreeMixin {
  int _currentScreen = 0;
  int get currentScreen => _currentScreen;

  final List<Widget> screens = const [
    Home(),
    Search(),
    Authenticate(),
    Setting(),
  ];

    

  void changeScreen(int value){
    _currentScreen = value;
    notifyListeners();
  }
}
