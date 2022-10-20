// ignore_for_file: prefer_const_constructors
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/constants/app_assets.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/models/data_news.dart';

class ReadNews extends StatelessWidget {
  ReadNews({super.key, required this.dataNews});
  final DataNews dataNews;

  final ScrollController _controller = ScrollController();
  void _scrollTop() {
    _controller.animateTo(
      _controller.position.minScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.bookmark_border, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.upload_outlined, color: Colors.black)),
        ],
      ),
      body: ListView(controller: _controller, children: [
        Image(
          image: NetworkImage(dataNews.images[0]),
          width: window.physicalSize.width,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            Text(
              dataNews.title,
              style: AppStyles.bold.copyWith(
                fontSize: 20,
                height: 1.5,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(48)),
                          child: Image(
                            image: AssetImage(AppAssets.avatar),
                            width: 45,
                            height: 45,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "By ${dataNews.source}",
                          style: AppStyles.medium
                              .copyWith(color: Colors.grey, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "1 giờ trước",
                    style: AppStyles.regular
                        .copyWith(color: Colors.grey, fontSize: 14),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.comment_bank_outlined),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("8 bình luận", style: AppStyles.regular),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.favorite_border),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("34 thích", style: AppStyles.regular),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.share_rounded),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Share", style: AppStyles.regular),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                dataNews.content,
                style: AppStyles.regular.copyWith(fontSize: 16),
              ),
            )
          ]),
        )
      ]),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.white,
        onPressed: _scrollTop,
        child: Icon(
          Icons.arrow_upward,
          color: Colors.black,
        ),
      ),
    );
  }
}
