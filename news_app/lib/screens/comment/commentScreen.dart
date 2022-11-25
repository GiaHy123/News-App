import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/models/comment_news.dart';
import 'package:news_app/models/news_status.dart';
import 'package:news_app/provider/user_management.dart';
import 'package:news_app/screens/comment/widgets/render_comment.dart';
import 'package:news_app/screens/login/loginUI.dart';
import 'package:news_app/screens/login/widgets/alertLogin.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen(
      {super.key,
      required this.idNews,
      required this.status,
      required this.isChangeComment});
  final String idNews;
  final NewsStatus status;
  final Function isChangeComment;
  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<CommentNews> listCmt = [];
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.status.comment.forEach((element) {
      listCmt.add(CommentNews.fromJson(element));
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String idPost = widget.idNews;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          "Comment",
          style: AppStyles.regular.copyWith(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: ListView.builder(
                itemCount: listCmt.length,
                itemBuilder: (context, index) =>
                    RenderComment(cmt: listCmt[index])),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      controller: myController,
                      decoration: const InputDecoration(
                        hintText: "Comment",
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (context.read<UserManagement>().loginSuccess) {
                        CommentNews cmt = CommentNews(
                          content: myController.text,
                          idUser: context.read<UserManagement>().user.id!,
                          nameUser: context.read<UserManagement>().user.name!,
                          avatarUser:
                              context.read<UserManagement>().user.avatar!,
                        );
                        setState(() {
                          myController.text = '';
                          listCmt.add(cmt);
                          widget.status.comment.add(cmt.toJson());
                          widget.isChangeComment();
                        });
                      } else {
                        alertLogin(context);
                      }                        
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.blue,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
