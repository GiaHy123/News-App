import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
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
              child: Image(
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQW5Py7uNdxwq-p50yS9MuUvjrz2ll7fcRVug&usqp=CAU")),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "Nguyễn Văn Linh",
                style: AppStyles.medium.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            Text("123@gmail.com",
                style: AppStyles.regular.copyWith(
                  fontSize: 14,
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 181, 192, 187),
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
                            Icons.account_box,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Profile",
                              style: AppStyles.regular
                                  .copyWith(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.arrow_forward_sharp,
                            color: Colors.black),
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
                  color: Color.fromARGB(255, 181, 192, 187),
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
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Privacy",
                              style: AppStyles.regular
                                  .copyWith(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.arrow_forward_sharp,
                            color: Colors.black),
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
                  color: Color.fromARGB(255, 181, 192, 187),
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
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Help and suport",
                              style: AppStyles.regular
                                  .copyWith(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.arrow_forward_sharp,
                            color: Colors.black),
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
                  color: Color.fromARGB(255, 181, 192, 187),
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
                            Icons.contactless,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Contact",
                              style: AppStyles.regular
                                  .copyWith(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.arrow_forward_sharp,
                            color: Colors.black),
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
                  color: Color.fromARGB(255, 181, 192, 187),
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
                            Icons.logout,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Logout",
                              style: AppStyles.regular
                                  .copyWith(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.arrow_forward_sharp,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
