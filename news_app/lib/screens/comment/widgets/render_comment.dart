import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/models/comment_news.dart';

class RenderComment extends StatelessWidget {
  const RenderComment({super.key, required this.cmt});
  final CommentNews cmt;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(children: [
        Container( 
          margin: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
                  radius: 24,
                  child: ClipOval(child: Image.asset('assets/images/avatar.png')),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cmt.nameUser, style: AppStyles.bold.copyWith(
              fontSize: 20
            ),),
            Text(cmt.content, style: AppStyles.regular.copyWith(
              fontSize: 14
            ),)
          ],
        )
      ]),
    );
  }
}