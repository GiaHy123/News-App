// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/provider/user_management.dart';
import 'package:provider/provider.dart';

class CustomInfo extends StatelessWidget {
  const CustomInfo({super.key, required this.type});

  final String type;
  @override
  Widget build(BuildContext context) {
    String title = '';
    String data = '';
    switch (type){
      case 'name':
        title = "Name";
        data = context.watch<UserManagement>().user.name.toString();
        break;
      case 'email':
        title = "Email";
        data = context.watch<UserManagement>().user.email.toString();
        break;
      case 'birthday':
        title = "Date of Birth";
        final temp = context.watch<UserManagement>().user.birthday;
        data = '${temp.day}/${temp.month}/${temp.year}';
        break;
      default:
        break;
    }
    var widthWindow = window.physicalSize.width;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        width: widthWindow /3,
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
