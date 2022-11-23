// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/collection.dart';
import 'package:news_app/firebase/cloud_firesotre.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/models/news_status.dart';
import 'package:news_app/models/user_info.dart';
import 'package:news_app/provider/user_management.dart';
import 'package:news_app/screens/comment/commentScreen.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_styles.dart';

class ReadNews extends StatefulWidget {
  const ReadNews({super.key, required this.dataNews});
  final News dataNews;

  @override
  State<ReadNews> createState() => _ReadNewsState();
}

class _ReadNewsState extends State<ReadNews> {
  NewsStatus status = NewsStatus(comment: [], like: []);
  late UserInfo user;
  bool isLike = false;
  bool isBookmark = false;
  bool isChangeLike = false;
  bool isChangeBookMark = false;
  bool isChangeComment = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = context.read<UserManagement>().user;
    user.bookmark;
    setUpData();
  }

  @override
  void dispose() {
    if (isChangeBookMark){
      CloudFirestore().updateData(Collection.users, user.id.toString(), user.toJson());
    }
    if(isChangeLike || isChangeComment){
      CloudFirestore().updateData(Collection.newsStatus, widget.dataNews.id.toString(), status.toJson());
    }
    super.dispose();
  }

  // get cmt and like
  void setUpData() async {
    var data = await CloudFirestore()
        .getData(Collection.newsStatus, widget.dataNews.id.toString());
    setState(() {
      status = NewsStatus.fromJson(data!);
      isBookmark = user.bookmark
              .indexWhere((element) => element == widget.dataNews.id) >=
          0;
      isLike = status.like.indexWhere((element) => element == user.id) >= 0;
    });
  }

  final ScrollController _controller = ScrollController();
  void _scrollTop() {
    _controller.animateTo(
      _controller.position.minScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  void ChangeComment(){
    setState(() {
      isChangeComment = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    News dataNews = widget.dataNews;
    final author =
        dataNews.author.length < 20 ? dataNews.author : "Monsieur Kuma";
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
              onPressed: () {
                setState(() {
                  isChangeBookMark = !isChangeBookMark;
                  isBookmark = !isBookmark;
                });
                final findNews =
                    user.bookmark.indexWhere((v) => v == dataNews.id);
                if (findNews == -1 && isBookmark) {
                  user.bookmark.add(dataNews.id);
                }
                if (!isBookmark) {
                  user.bookmark.remove(dataNews.id);
                }
              },
              icon: Icon(isBookmark ? Icons.bookmark : Icons.bookmark_border,
                  color: isBookmark ? Colors.blue : Colors.black)),
        ],
      ),
      body: ListView(controller: _controller, children: [
        Image(
          image: NetworkImage(dataNews.images.isNotEmpty
              ? dataNews.images[0].toString()
              : "https://pbs.twimg.com/media/Fhwj6IBVIAAGO5N?format=jpg&name=small"),
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
                          author,
                          style: AppStyles.medium
                              .copyWith(color: Colors.grey, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLike = !isLike;
                        isChangeLike = !isChangeLike;
                      });
                      final user = context.read<UserManagement>().user;
                      final findLike =
                          status.like.indexWhere((v) => v == user.id);
                      if (findLike == -1 && isLike) {
                        status.like.add(user.id!);
                      }
                      if (!isLike) {
                        status.like.remove(user.id!);
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                          isLike ? Icons.favorite : Icons.favorite_border,
                          color: isLike ? Colors.blue : Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("${status.like.length.toString()} thích",
                              style: AppStyles.regular
                                  .copyWith(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CommentScreen(idNews: dataNews.id.toString(), status: status, isChangeComment: ChangeComment)));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.comment_bank_outlined,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                              "${status.comment.length.toString()} bình luận",
                              style: AppStyles.regular
                                  .copyWith(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text("${dataNews.discription}\n",
                style: AppStyles.regular.copyWith(fontSize: 16)),

            // ignore: avoid_function_literals_in_foreach_calls
            for (final content in dataNews.content)
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