import 'dart:async';

import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/screens/option_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user = auth.currentUser;

    if (user != null) {
      Timer(Duration(seconds: 3),
              () =>
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()))
      );
    } else {
      Timer(Duration(seconds: 3),
            () =>
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OptionScreen())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .3,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * .6,

              image: AssetImage('images/blog.png')),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Developed By Sajjad Mustafa!',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                    fontWeight: FontWeight.w300),
              ),
            ),
          )
        ],
      ),
    );
  }
}
