import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/provider/user_management.dart';
import 'package:news_app/screens/login/loginUI.dart';
import 'package:news_app/screens/profile/profile.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<UserManagement>().loginSuccess ? const Profile() :  
    Scaffold(
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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You are not logged in",
              style: AppStyles.medium.copyWith(
                fontSize: 24,
              )),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
            },
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.blue)))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Login",
                style: AppStyles.regular.copyWith(fontSize: 16),
              ),
            ),
          )
        ],
      )),
    );
  }
}
