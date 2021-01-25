import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plannerdemo/bloc/orders/getOrders.dart';
import 'package:plannerdemo/widgets/newOrder.dart';
import 'package:google_fonts/google_fonts.dart';

class homeMainActicity extends StatefulWidget {
  @override
  _homeMainActicityState createState() => _homeMainActicityState();
}

class _homeMainActicityState extends State<homeMainActicity> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder<DocumentSnapshot>(
                  future:
                      users.doc(FirebaseAuth.instance.currentUser.uid).get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data = snapshot.data.data();
                      return Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text("Hello",
                                  style: GoogleFonts.ptSerif(fontSize: 22)),
                              Text(
                                "${data['name']}",
                                style: GoogleFonts.ptSerif(fontSize: 30),
                              ),
                            ],
                          ),
                        ],
                      );
                    }

                    return Text(" ");
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Your Tasks",
                            style: GoogleFonts.ptSerif(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      newOrder(),
                    ]),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 320,
                  height: 800,
                  child: yCardsStream(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
