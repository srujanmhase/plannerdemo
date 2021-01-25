import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plannerdemo/bloc/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/authscreen.dart';
import 'screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: initiState(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class initiState extends StatefulWidget {
  @override
  _initiStateState createState() => _initiStateState();
}

class _initiStateState extends State<initiState> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return Material(
        child: Center(
          child: Text("Error Initializing Firebase"),
        ),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Center(
        child: CupertinoActivityIndicator(),
      );
    }

    return firstScreen();
  }
}

class firstScreen extends StatefulWidget {
  @override
  _firstScreenState createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  checkIfUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool("isLoggedIn");
    if (loggedIn == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: authBroadcast().stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == "loggedIn") {
              return homePage();
            } else if (snapshot.data == "loggedOut") {
              return authPage();
            }
          } else if (!snapshot.hasData) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (snapshot.error) {
            return Center(
              child: Text("Something went wrong"),
            );
          }
        });
  }
}
