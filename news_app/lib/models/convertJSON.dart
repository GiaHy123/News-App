// ignore_for_file: file_names

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

  static Future<List<String>> readPrivacy() async {
    final String response = await rootBundle.loadString('assets/data/privacy.json');
    final data = await json.decode(response);
    List<String> privacy = [];
    for (var item in data){
      privacy.add(item);
    }
    return privacy;
  }

  static Future<List<String>> readAboutUs() async {
    final String response = await rootBundle.loadString('assets/data/aboutUs.json');
    final data = await json.decode(response);
    List<String> aboutUs = [];
    for (var item in data){
      aboutUs.add(item);
    }
    return aboutUs;
  }

  static Future<List<String>> readHelpAndSuport() async {
    final String response = await rootBundle.loadString('assets/data/helpAndSuport.json');
    final data = await json.decode(response);
    List<String> helpAndSuport = [];
    for (var item in data){
      helpAndSuport.add(item);
    }
    return helpAndSuport;
  }
}
