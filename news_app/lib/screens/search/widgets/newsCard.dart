// ignore_for_file: file_names
import 'package:flutter/material.dart';
//import 'package:news_app/models/data_news.dart';
import 'package:news_app/models/news.dart';

Widget newsCard(News value) {
  return Container(

    //margin: const EdgeInsets.only(left: 10, right: 10),
    //color: Color.fromARGB(255, 203, 214, 214),
    //padding: const EdgeInsets.symmetric(vertical: 25),
    //alignment: Alignment.center,
    // ignore: prefer_const_constructors
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      // ignore: prefer_const_constructors
      color: Color.fromARGB(255, 235, 239, 246),
    ),
    //margin: const EdgeInsets.only(left: 10, right: 10),
    margin: const EdgeInsets.all(7),
    // ignore: prefer_const_literals_to_create_immutables
    child: Row(children: [
      Container(
          margin: const EdgeInsets.only(left: 7),
          child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
          child: 
          Image(
              image: NetworkImage(value.images[0].toString()), height: 130, width: 150,
              fit: BoxFit.contain,
              ))
              ),
      //Image.network(value.images[0]),
      //Image(image: Image.network())
      Expanded(
          child: Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            value.title,
            maxLines: 3,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const <Widget>[
            Icon(
              Icons.hotel_class,
              color: Colors.pink,
              size: 24.0,
              //semanticLabel: 'Text to announce in accessibility modes',
            ),
            Icon(
              Icons.local_drink,
              color: Colors.green,
              size: 30.0,
            ),
          ],
        )
      ])),
    ]),
  );
}
