// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';

Widget RenderCateGory(isActive, name, index,  Function onPress) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      elevation: 0,
    ),
    onPressed: () => onPress(index),
    child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Container(
            height: 20,
            decoration: isActive
                ? BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 2,
                            color: Colors.blue,
                            strokeAlign: StrokeAlign.inside)))
                : null,
            child: Text(
              name,
              style: AppStyles.bold.copyWith(
                  fontSize: 14, color: isActive ? Colors.black : Colors.grey),
            ))),
  );
}
