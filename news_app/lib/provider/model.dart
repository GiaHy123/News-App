import 'package:flutter/foundation.dart';
import 'package:news_app/models/convertJSON.dart';

import '../models/news.dart';

class Model with ChangeNotifier, DiagnosticableTreeMixin {
  List<News> _data = [];
  List<News> get data => _data;
  void getDataNews() async {
    _data = await ConvertJSON.readJsonNews();
    notifyListeners();
  }
}