import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';

class CustomInfo extends StatelessWidget {
  const CustomInfo({super.key, required this.title, required this.data});

  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    var width = window.physicalSize.width;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        width: width * 0.6,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: AppStyles.regular.copyWith(color: Colors.blue, fontSize: 12),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              data,
              style: AppStyles.medium.copyWith(fontSize: 16),
            ),
          ),
        ]));
  }
}
