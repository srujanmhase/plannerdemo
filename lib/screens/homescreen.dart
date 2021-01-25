import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plannerdemo/bloc/auth.dart';
import 'package:plannerdemo/screens/authscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'mainactivity.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  FirebaseAuth userAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<dynamic>(
          stream: authBroadcast().stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == "loggedIn") {
                return mainActivity();
              } else if (snapshot.data == "loggedOut") {
                Future.delayed(Duration.zero, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => authPage()),
                  );
                });
              }
            } else if (!snapshot.hasData) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (snapshot.error) {
              return Center(
                child: Text("Error"),
              );
            }
            return Center(
              child: CupertinoActivityIndicator(),
            );

            ;
          }),
    );
  }
}
