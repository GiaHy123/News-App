// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:news_app/models/data_news.dart';
import 'package:news_app/screens/home/data/data.dart';
import '../../home/data/data.dart';

Widget newsCard (DataNews value) {
  return Container(
    margin: const EdgeInsets.all(20),
    // ignore: prefer_const_literals_to_create_immutables
    child: Column(children: [
      Image.network('https://www.rd.com/wp-content/uploads/2021/01/GettyImages-1175550351.jpg'),
      //Image(image: Image.network())
      //Text(value.title)
    ]),
    
  );
}