import 'dart:ffi';

import 'package:flutter/material.dart';


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
        title: const Text("Login"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(40,0, 40, 0),
            child: Image.asset("assets/images/logo.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30,50, 30, 0),
            child :TextField(
              style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            labelText: "Username",
            labelStyle: TextStyle(color: Color(0xff888888),fontSize: 15)
          ),
    ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30,40, 30, 0),
            child :TextField(
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Color(0xff888888),fontSize: 15)
              ),
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.fromLTRB(30,40, 30, 30),
                child :TextField(
                  style: TextStyle(fontSize: 18),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Color(0xff888888),fontSize: 15)
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 30, 0),
                  child: Text("Show",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),)
              ),
            ],
          ),
          Container(
              width:250 ,
              padding: EdgeInsets.all(20),
              child:TextButton(
                child:Text("Sign up"),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  backgroundColor: Colors.blue,
                   foregroundColor: Colors.white),
                onPressed: () {
                },
              )
          ),
         Row(
           children: [
             Expanded(child: Divider(color: Colors.grey,)),
             Text("or sign up with",
               style: TextStyle(
                 fontSize: 14,
                 fontWeight: FontWeight.w500,
                 color: Colors.grey,
               ),
             ),
             Expanded(child: Divider(color: Colors.grey,)),
           ],
         ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
           child: FloatingActionButton.extended(onPressed: () {  },
              icon: Image.asset("assets/images/google.png",
                height: 32,
                width: 32,),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              label: Text("Sign in with Google"),
            ),
          )
        ],
      )
    );
  }
}