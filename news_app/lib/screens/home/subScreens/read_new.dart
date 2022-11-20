// ignore_for_file: prefer_const_constructors
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import '../../../constants/app_styles.dart';
class ReadNews extends StatelessWidget {
  ReadNews({super.key, required this.dataNews});
  final News dataNews;

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
    final author = dataNews.author.length < 20 ? dataNews.author : "Monsieur Kuma";
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
          image: NetworkImage(dataNews.images.isNotEmpty ? dataNews.images[0].toString() : "https://pbs.twimg.com/media/Fhwj6IBVIAAGO5N?format=jpg&name=small"),
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
                            image: NetworkImage(
                                "https://img.hoidap247.com/picture/question/20201023/large_1603461860810.jpg"),
                            width: 45,
                            height: 45,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "By $author",
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
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
            ),
            Text("${dataNews.discription}\n",
              style: AppStyles.regular.copyWith(fontSize: 16)),

            // ignore: avoid_function_literals_in_foreach_calls
            for(final content in dataNews.content)
              Text("$content\n",
              style: AppStyles.regular.copyWith(fontSize: 16)),
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
