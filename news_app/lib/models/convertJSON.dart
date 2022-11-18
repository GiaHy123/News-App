import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:news_app/models/news.dart';

class ConvertJSON {
  static Future<List<News>> readJsonNews() async {
    final String response = await rootBundle.loadString('assets/data/dataNews.json');
    final data = await json.decode(response);
    List<News> listNews = [];
    for (var element in data) {
      listNews.add(News.fromJson(element));
    }
    return listNews;
  }

  static Future<List<String>> readCategory() async {
    final String response = await rootBundle.loadString('assets/data/category.json');
    final data = await json.decode(response);
    List<String> category = [];
    for (var item in data){
      category.add(item);
    }
    return category;
  }
}
