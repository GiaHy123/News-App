// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';
//import 'package:news_app/models/data_news.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/screens/home/subScreens/read_news.dart';
//import 'package:news_app/screens/home/subScreens/read_new.dart';

class NewCard extends StatelessWidget {
  const NewCard({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ReadNews(dataNews: news))),
      child: Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        // ignore: prefer_const_constructors
        color: Color.fromARGB(255, 235, 239, 246),
      ),
      child: Row(children: [
        Container(
            margin: const EdgeInsets.only(left: 7),
            child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
            child: 
            Image(
                image: NetworkImage(news.images.isNotEmpty ? news.images[0].toString() : 'https://pbs.twimg.com/media/FiJaB7CaUAEH_Jn?format=jpg&name=medium'), height: 130, width: 150,
                fit: BoxFit.contain,
                ))
                ),
        Expanded(
            child: Column(children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              news.title,
              maxLines: 3,
              style: AppStyles.medium.copyWith(
                fontSize: 20,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: const <Widget>[
          //     Icon(
          //       Icons.hotel_class,
          //       color: Colors.pink,
          //       size: 24.0,
          //     ),
          //     Icon(
          //       Icons.local_drink,
          //       color: Colors.green,
          //       size: 30.0,
          //     ),
          //   ],
          // )
        ])),
      ]),
      ),
    );
  }
}

