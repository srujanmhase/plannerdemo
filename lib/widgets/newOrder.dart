import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plannerdemo/screens/newOrderScreen.dart';

class newOrder extends StatefulWidget {
  @override
  _newOrderState createState() => _newOrderState();
}

class _newOrderState extends State<newOrder> {
  DocumentReference userDoc = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.uid);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userDoc.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data.data();
          if (data['userRole'] == 'sales') {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => newOrderForm()));
              },
              child: Container(
                  height: 35,
                  width: 130,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(child: Text("Create a new Order"))),
            );
          } else {
            return SizedBox(
              height: 0,
            );
          }
        } else if (snapshot.hasError) {
          return Text("Ran into an error");
        }
        return SizedBox(
          height: 0,
        );
      },
    );
  }
}
