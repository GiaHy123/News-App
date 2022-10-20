// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/screens/home/data/data.dart';
import 'package:news_app/screens/home/widget/render_category.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentCategory = 0;
  void ChangeCurrentCatagory (index) {
      setState(() {
        currentCategory = index;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.menu,
              color: Colors.blue,
            ),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.only(left: 24),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.black,
                        ),
                        Text("HCM City, Viet Nam",
                            style: AppStyles.regular
                                .copyWith(color: Colors.black, fontSize: 16)),
                      ],
                    ))),
            Icon(
              Icons.notifications,
              color: Colors.blue,
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 24,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataCategory.length,
                itemBuilder: (context, index) =>  RenderCateGory( index == currentCategory ? true : false , dataCategory[index], index ,ChangeCurrentCatagory)
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dataCategory.length,
                itemBuilder: (context, index) =>  RenderCateGory( index == currentCategory ? true : false , dataCategory[index], index ,ChangeCurrentCatagory)
              ),
            ),
          ],
        ),
      )
    );
  }
}
