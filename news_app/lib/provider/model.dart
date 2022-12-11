import 'package:flutter/foundation.dart';
import 'package:news_app/models/convertJSON.dart';

import '../models/news.dart';

class Model with ChangeNotifier, DiagnosticableTreeMixin {
  List<News> _data = [];
  List<News> get data => _data;

  List<String> _category = [];
  List<String> get category => _category;

  List<News> _newsFollowCategory = [];
  List<News> get newsFollowCategory => _newsFollowCategory;

  List<String> _privacy = [];
  List<String> get privacy => _privacy;

  List<String> _aboutUs = [];
  List<String> get aboutUs => _aboutUs;

  List<String> _helpAndSuport= [];
  List<String> get helpAndSuport=> _helpAndSuport;

  void getDataNews() async {
    _data = await ConvertJSON.readJsonNews();
    _newsFollowCategory = _data;
    notifyListeners();
  }

  void getNewsFollowCategory(String category) {
    List<News> data = [];
    for (var item in _data) {
      if (item.category == category) {
        data.add(item);
      }
    }
    _newsFollowCategory = data;
    notifyListeners();
  }

  void setAllNews() => _newsFollowCategory = _data;

  Future<void> getCategory() async {
    _category = await ConvertJSON.readCategory();
    notifyListeners();
  }

  Future<void> getPrivacy() async {
    _privacy = await ConvertJSON.readPrivacy();
    notifyListeners();
  }
  Future<void> getAboutUs() async {
    _aboutUs = await ConvertJSON.readAboutUs();
    notifyListeners();
  }
  Future<void> getHelpAndSuport() async {
    _helpAndSuport = await ConvertJSON.readHelpAndSuport();
    notifyListeners();
  }
  
}
