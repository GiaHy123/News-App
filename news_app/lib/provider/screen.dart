import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/home/home.dart';
import 'package:news_app/screens/profile/authenticate.dart';
import 'package:news_app/screens/search/search.dart';
import 'package:news_app/screens/setting/setting.dart';


class Screen with ChangeNotifier, DiagnosticableTreeMixin {

  final List<Widget> _screens = const [
    Home(),
    Search(),
    Authenticate(),
    Setting(),
  ];

  int _currentTab = 0;
  int get currentTab => _currentTab;

  Widget _screen = const Home();
  Widget get screen => _screen;

  void changeScreen(int value) {
    _currentTab = value;
    _screen = _screens[value];
    notifyListeners();
  }
}
