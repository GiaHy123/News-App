import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Bookmark",
            style: AppStyles.regular.copyWith(
              fontSize: 24,
              color: Colors.black,
            )),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: bookmark.length,
              itemBuilder: (context, index) => newsCard(dataNews[index]))),
    );
  }
}
