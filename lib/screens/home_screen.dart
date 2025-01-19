import 'dart:ffi';

import 'package:blog_app/screens/add_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'login_screen.dart';
import 'option_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dbRef = FirebaseDatabase.instance.ref('Posts/Post List');
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Blogs'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddPostScreen()));
            },
              child: Icon(Icons.add)),
          SizedBox(width: 20,),
          InkWell(
              onTap: (){
                auth.signOut().then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => OptionScreen()));
                });
              },
              child: Icon(Icons.logout)),
          SizedBox(width: 20,),
        ],

      ) ,
      body: Center(
        child:
        FirebaseAnimatedList(
          defaultChild: CircularProgressIndicator(),
            query: dbRef,
            itemBuilder: (context, snapshot, index, animation){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInImage(

                      placeholder: AssetImage('images/blog.png'), // Placeholder image while the actual image is loading
                      image: NetworkImage(snapshot.child('pImage').value.toString()),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,

                    ),
              SizedBox(height: 8),
              Text(
              snapshot.child('pTitle').value.toString(),
              style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              ),
              ),

                    Text(
                        snapshot.child('pDescription').value.toString()),
                  ],
                ),
              );


            }
        ),
      ),
    );
  }
}
