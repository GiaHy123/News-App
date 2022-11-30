// ignore_for_file: unused_import, prefer_const_constructors, sort_child_properties_last

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/provider/user_management.dart';
import 'package:news_app/screens/profile/widgets/ChooseImage.dart';
import 'package:news_app/screens/profile/widgets/CustomInfo.dart';
import 'package:provider/provider.dart';

import '../../firebase/auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var widthWindow = window.physicalSize.width;
  bool isChange = false;
  TextEditingController nameController = TextEditingController();
  late String birthday;
  late String nameChange = '';
  late DateTime birthdayChange  = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserManagement>().user;
    String avatar = user.avatar.toString();
    nameController.text = nameChange;
    birthday =
        '${user.birthday.day}/${user.birthday.month}/${user.birthday.year}';

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
      body: SingleChildScrollView(
        child: Container(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChooseImage()));
                      },
                      child: const Text('Change avatar')),
                ),
                if (isChange)
                  (Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: widthWindow / 3,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name",
                                  style: AppStyles.regular
                                      .copyWith(color: Colors.blue, fontSize: 12),
                                ),
                                TextField(
                                  style: AppStyles.medium.copyWith(
                                    fontSize: 16,
                                    letterSpacing: 1.1,
                                  ),
                                  enabled: isChange,
                                  controller: nameController,
                                ),
                              ])),
                      CustomInfo(type: "email"),
                      Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          width: widthWindow / 3,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.grey))),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date of Birth",
                                  style: AppStyles.regular
                                      .copyWith(color: Colors.blue, fontSize: 12),
                                ),
                                TextButton(
                                    onPressed: () => {
                                          DatePicker.showDatePicker(context,
                                              showTitleActions: true,
                                              minTime: DateTime(1990, 1, 1),
                                              maxTime: DateTime.now(),
                                              onConfirm: (date) {
                                               setState(() {
                                                 birthdayChange = date;
                                               });
                                          },
                                              currentTime: DateTime.now(),
                                              locale: LocaleType.en)
                                        },
                                    child: Text(
                                      '${birthdayChange.day}/${birthdayChange.month}/${birthdayChange.year}',
                                      style: AppStyles.medium.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    )),
                              ])),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Container(
                          margin: const EdgeInsets.only(right: 12),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isChange = !isChange;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Back",
                                style: AppStyles.regular.copyWith(fontSize: 16),
                              ),
                            ),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Colors.red),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.red)))),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            user.name = nameController.text;
                            user.birthday = birthdayChange;
                            await context.read<UserManagement>().updateUser();
                            setState(() {
                              isChange = !isChange;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Save",
                              style: AppStyles.regular.copyWith(fontSize: 16),
                            ),
                          ),
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.blue)))),
                        ),
                      ])
                    ],
                  ))
                else
                  (Column(
                    children: [
                      CustomInfo(type: "name"),
                      CustomInfo(type: "email"),
                      CustomInfo(type: "birthday"),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nameChange = context.read<UserManagement>().user.name.toString();
                            birthdayChange =context.read<UserManagement>().user.birthday;
                            isChange = !isChange;
                          });
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
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.blue)))),
                      ),
                    ],
                  )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
