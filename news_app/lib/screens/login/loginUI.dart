import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:news_app/firebase/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String pass = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Image.asset("assets/images/logo.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
              child: TextField(
                onChanged: (value) => {setState(() {
                  email = value;
                })},
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                    labelText: "Username",
                    labelStyle:
                        TextStyle(color: Color(0xff888888), fontSize: 15)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
              child: TextField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle:
                        TextStyle(color: Color(0xff888888), fontSize: 15)),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 40, 30, 30),
                  child: TextField(
                    onChanged:(value) => {setState(() {
                      pass = value;
                    })},
                    style: const TextStyle(fontSize: 18),
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: "Password",
                        labelStyle:
                            TextStyle(color: Color(0xff888888), fontSize: 15)),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 30, 0),
                    child: const Text(
                      "Show",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            Container(
                width: 250,
                padding: const EdgeInsets.all(20),
                child: TextButton(
                  child: const Text("Sign up"),
                  style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    print(email);
                    print(pass);
                    CreateAccountWithEmailAndPass(email, pass);
                  },
                )),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Expanded(
                    child: Divider(
                  color: Colors.grey,
                )),
                const Text(
                  "or sign up with",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const Expanded(
                    child: Divider(
                  color: Colors.grey,
                )),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: FloatingActionButton.extended(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/google.png",
                  height: 32,
                  width: 32,
                ),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                label: const Text("Sign in with Google"),
              ),
            )
          ],
        ));
  }
}
