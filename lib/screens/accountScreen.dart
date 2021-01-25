import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class accountScreen extends StatefulWidget {
  @override
  _accountScreenState createState() => _accountScreenState();
}

class _accountScreenState extends State<accountScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 25, 0, 0),
                  child: Text("Your account",
                      style: GoogleFonts.ptSerif(fontSize: 25)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 60,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${data['name']}",
                              style: GoogleFonts.ptSerif(fontSize: 20),
                            ),
                            Text("${data['userRole']}",
                                style: GoogleFonts.ptSerif(fontSize: 16)),
                            Text(" ${data['email']}",
                                style: GoogleFonts.roboto(fontSize: 14))
                          ],
                        );
                      }

                      return Text("loading");
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          "Sign Out",
                          style: GoogleFonts.roboto(
                              fontSize: 15, color: Colors.white),
                        ))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Designed and Developed by Srujan S. Mhase",
              style: TextStyle(color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
