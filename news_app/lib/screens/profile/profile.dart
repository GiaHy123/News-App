// ignore_for_file: unused_import, prefer_const_constructors, sort_child_properties_last

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/constants/app_avatar.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/provider/user_management.dart';
import 'package:news_app/screens/profile/widgets/CustomInfo.dart';
import 'package:provider/provider.dart';

import '../../firebase/auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String avatar = AppAvatar.avatar1;
  bool showChange = false;
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
                child: ClipOval(child: Image.asset(avatar)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        showChange = !showChange;
                      });
                    }, child: const Text('Change avatar')),
              ),
              if(showChange)(
              DropdownButton<String>(
                value: avatar,
                // icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                // underline: Container(
                //   height: 2,
                //   color: Colors.deepPurpleAccent,
                // ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    avatar = value!;
                  });
                },
                items: AppAvatar.listAvatar
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Image.asset(value),
                  );
                }).toList(),
              )),
              const CustomInfo(type: "name"),
              const CustomInfo(type: "email"),
              const CustomInfo(type: "birthday"),
              ElevatedButton(
                onPressed: () {
                  final userId = context.read<UserManagement>().user.id;
                  context.read<UserManagement>().getUser(userId!);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Change",
                    style: AppStyles.regular.copyWith(fontSize: 16),
                  ),
                ),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
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
