// ignore_for_file: unused_import, prefer_const_constructors, sort_child_properties_last

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/screens/profile/widgets/CustomInfo.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: AppStyles.medium.copyWith(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        height: window.physicalSize.height,
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 56,
                child: ClipOval(child: Image.asset('assets/images/avatar.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextButton(
                    onPressed: () {}, child: const Text('Change avatar')),
              ),
              const CustomInfo(title: "Name", data: "Nguyễn Văn Linh"),
              const CustomInfo(title: "Email", data: "vanlinh14121@gmail.com"),
              const CustomInfo(title: "Date of birth", data: "10/06/2002"),
              ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Change", style: AppStyles.regular.copyWith(
                    fontSize: 16
                  ),),
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue)))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
