import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/provider/model.dart';
import 'package:news_app/provider/user_management.dart';
import 'package:news_app/screens/search/widgets/newsCard.dart';
import 'package:provider/provider.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  List<News> dataNews = [];
  List<int> bookmark = [];

  @override
  void initState() {
    super.initState();
    bookmark = context.read<UserManagement>().user.bookmark;
    for (var element in bookmark) {
      dataNews.add(context.read<Model>().data[element - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
        itemCount: bookmark.length,
        itemBuilder: (context, index) => newsCard(dataNews[index])
      )),
    );
  }
}
