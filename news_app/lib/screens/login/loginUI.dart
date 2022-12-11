// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:news_app/provider/user_management.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Image.asset("assets/images/logo.jpg"),
                ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          context
                              .read<UserManagement>()
                              .loginWithAnonymous()
                              .then((value) => Navigator.pop(context));
                        },
                        icon: Image.asset(
                          "assets/images/anonymous.png",
                          height: 32,
                          width: 32,
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        label: const Text("Anonymous login"),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          context
                              .read<UserManagement>()
                              .loginWithGoogle()
                              .then((value) => Navigator.pop(context));
                        },
                        icon: Image.asset(
                          "assets/images/google.png",
                          height: 32,
                          width: 32,
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        label: const Text("Sign in with Google"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
