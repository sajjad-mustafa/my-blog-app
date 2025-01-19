import 'package:blog_app/components/round_button.dart';
import 'package:blog_app/screens/login_screen.dart';
import 'package:blog_app/screens/signin.dart';
import 'package:flutter/material.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('images/blog.png',),height: 100,width: 100,),
              SizedBox(height: 20,),
              RoundButton(title: 'Login', onPress: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },),
              SizedBox(height: 30,),
              RoundButton(title: 'Register', onPress: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },)

            ],
          ),
        ),
      ),
    );
  }
}
