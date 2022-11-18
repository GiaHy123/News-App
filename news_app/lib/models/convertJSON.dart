import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:news_app/models/news.dart';

class ConvertJSON {
  static Future<List<News>> readJsonNews() async {
    final String response = await rootBundle.loadString('assets/data/dataNews.json');
    final dataNews = await json.decode(response);
    List<News> listNews = [];
    for (var element in dataNews) {
      listNews.add(News.fromJson(element));
    }
    return listNews;
  }
}
