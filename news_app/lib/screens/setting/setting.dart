import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/provider/screen.dart';
import 'package:news_app/provider/user_management.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    bool isLogin = context.watch<UserManagement>().loginSuccess;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          width: window.physicalSize.width,
          child: Column(children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: CircleAvatar(
                radius: 56,
                child: ClipOval(child: Image.asset(context.watch<UserManagement>().user.avatar.toString())),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                isLogin ? context.watch<UserManagement>().user.name.toString() : 'User',
                style: AppStyles.medium.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            Text(
                isLogin ? context.watch<UserManagement>().user.email.toString() : '',
                style: AppStyles.regular.copyWith(
                  fontSize: 14,
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                height: 50,
                child: TextButton(
                  onPressed: () {
                    context.read<Screen>().changeScreen(2);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.account_box,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Profile",
                              style: AppStyles.regular
                                  .copyWith(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.arrow_forward_sharp,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                height: 50,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.privacy_tip_sharp,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Privacy",
                              style: AppStyles.regular
                                  .copyWith(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.arrow_forward_sharp,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                height: 50,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.help,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Help and suport",
                              style: AppStyles.regular
                                  .copyWith(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.arrow_forward_sharp,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                height: 50,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.abc_outlined,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "About us",
                              style: AppStyles.regular
                                  .copyWith(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.arrow_forward_sharp,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            if (context.watch<UserManagement>().loginSuccess)
             Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                height: 50,
                child: TextButton(
                  onPressed: () {
                    context.read<UserManagement>().logOut();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Logout",
                              style: AppStyles.regular
                                  .copyWith(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.arrow_forward_sharp,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )
          
          ]),
        ),
      ),
    );
  }
}
