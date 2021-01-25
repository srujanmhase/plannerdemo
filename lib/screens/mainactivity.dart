import 'package:flutter/material.dart';
import 'package:plannerdemo/screens/accountScreen.dart';
import 'homemainactivity.dart';
import 'package:plannerdemo/bloc/auth.dart';
import 'authscreen.dart';
import 'package:flutter/cupertino.dart';
import 'notificationScreen.dart';

class mainActivity extends StatefulWidget {
  @override
  _mainActivityState createState() => _mainActivityState();
}

class _mainActivityState extends State<mainActivity> {
  final List<Widget> _children = [
    homeMainActicity(),
    notifScreen(),
    accountScreen(),
  ];
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<dynamic>(
          stream: authBroadcast().stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == "loggedIn") {
                return _children[_currentIndex];
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
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            onTabTapped(value);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.black),
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.black,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                title: Text(
                  "Alerts",
                  style: TextStyle(color: Colors.black),
                ),
                activeIcon: Icon(
                  Icons.notification_important,
                  color: Colors.black,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text(
                  "Account",
                  style: TextStyle(color: Colors.black),
                ),
                activeIcon: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ))
          ]),
    );
  }
}
