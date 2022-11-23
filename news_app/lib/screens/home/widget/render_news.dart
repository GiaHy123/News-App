// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/constants/app_assets.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/screens/home/subScreens/read_news.dart';

// ignore: non_constant_identifier_names
Widget RenderNews(News data, context) {
  return GestureDetector(
    onTap: () async  {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ReadNews(dataNews: data,)));
    },
    child: Container(
        padding: const EdgeInsets.fromLTRB(15,10,15,0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 244, 242, 242),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: Image(image: NetworkImage( data.images.isNotEmpty ? data.images[0].toString() : "https://pbs.twimg.com/media/Fhwj6IBVIAAGO5N?format=jpg&name=small"))),
              Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      data.title,
                      style: AppStyles.bold.copyWith(fontSize: 20, height: 1.2),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            const ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(48)),
                                child: Image(
                                  image: AssetImage(AppAssets.avatar),
                                  width: 30,
                                  height: 30,
                                )),
                            Container(
                                margin: const EdgeInsets.only(left: 12),
                                child: Text(
                                  data.author.length < 20 ? data.author : "Monsieur Kuma",
                                  style: AppStyles.bold.copyWith(
                                    color: Colors.blueAccent,
                                    fontSize: 14,
                                  ),
                                )),
                          ],
                        )),
                    Text(
                      data.discription,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.regular.copyWith(fontSize: 13, color: Colors.black45),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(vertical: 14),
                    //   child: Row(
                    //     children: [
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //         children: [
                    //           Icon(
                    //             Icons.favorite_border,
                    //             color: Colors.blue,
                    //           ),
                    //           Container(
                    //               margin:
                    //                   const EdgeInsets.symmetric(horizontal: 15),
                    //               child: Icon(Icons.comment_bank_outlined,
                    //                   color: Colors.blue)),
                    //           Icon(Icons.share_rounded, color: Colors.blue)
                    //         ],
                    //       ),
                    //       // Text(
                    //       //   "96 Comments",
                    //       //   style: AppStyles.regular,
                    //       // ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        )),
  );
}
