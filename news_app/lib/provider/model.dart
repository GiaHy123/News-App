import 'package:flutter/foundation.dart';
import 'package:news_app/models/convertJSON.dart';

import '../models/news.dart';

class Model with ChangeNotifier, DiagnosticableTreeMixin {
  List<News> _data = [];
  List<News> get data => _data;

  List<String> _category = [];
  List<String> get category =>  _category;

  List<News> _newsFollowCategory = [];
  List<News> get newsFollowCategory => _newsFollowCategory;

  void getDataNews() async {
    _data = await ConvertJSON.readJsonNews();
    _newsFollowCategory = _data;
    notifyListeners();
  }

  Future<void> getCategory() async {
    _category = await ConvertJSON.readCategory();
    notifyListeners();
  }

  void getNewsFollowCategory(String category){
    List<News> data = [];
    for (var item in _data) {
      if(item.category == category){
        data.add(item);
      }
    }
    _newsFollowCategory = data;
    notifyListeners();
  }

  void setAllNews () => _newsFollowCategory = _data;
}