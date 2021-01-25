import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class paintSales extends StatefulWidget {
  paintSales({this.targetOrder});
  DocumentReference targetOrder;
  @override
  _paintSalesState createState() => _paintSalesState();
}

class _paintSalesState extends State<paintSales> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  getData() async {
    final salesuid =
        await widget.targetOrder.get().then((DocumentSnapshot docSnap) => {
              if (docSnap.exists) {docSnap.data()['salesPersonnel'].toString()}
            });
    var salesUid = salesuid.elementAt(0).elementAt(0);
    print("bzz $salesUid");
    final salesEmail = await FirebaseFirestore.instance
        .collection('users')
        .doc(salesUid.toString())
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        return documentSnapshot['email'].toString();
      }
    });
    final salesName = await FirebaseFirestore.instance
        .collection('users')
        .doc(salesUid.toString())
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        return documentSnapshot['name'].toString();
      }
    });
    // print(userRole.toString());
    final planuid =
        await widget.targetOrder.get().then((DocumentSnapshot docSnap) => {
              if (docSnap.exists) {docSnap['planPersonnel'].toString()}
            });
    var planUid = planuid.elementAt(0).elementAt(0);
    final planEmail = await users
        .doc(planUid)
        .get()
        .then((DocumentSnapshot documentSnapshot) => {
              if (documentSnapshot.exists) {documentSnapshot['email']}
            });
    final planName = await users
        .doc(planUid)
        .get()
        .then((DocumentSnapshot documentSnapshot) => {
              if (documentSnapshot.exists) {documentSnapshot['name']}
            });
    var planNamef = planName.elementAt(0).elementAt(0);
    var planEmailf = planEmail.elementAt(0).elementAt(0);
    final purchuid =
        await widget.targetOrder.get().then((DocumentSnapshot docSnap) => {
              if (docSnap.exists) {docSnap['purchPersonnel']}
            });
    var purchUid = purchuid.elementAt(0).elementAt(0);
    final purchEmail = await users
        .doc(purchUid)
        .get()
        .then((DocumentSnapshot documentSnapshot) => {
              if (documentSnapshot.exists) {documentSnapshot['email']}
            });
    final purchName = await users
        .doc(purchUid)
        .get()
        .then((DocumentSnapshot documentSnapshot) => {
              if (documentSnapshot.exists) {documentSnapshot['name']}
            });
    var purchEmailf = purchEmail.elementAt(0).elementAt(0);
    var purchNamef = purchName.elementAt(0).elementAt(0);
    final manfuid =
        await widget.targetOrder.get().then((DocumentSnapshot docSnap) => {
              if (docSnap.exists) {docSnap['manfPersonnel']}
            });
    var manfUid = manfuid.elementAt(0).elementAt(0);
    final manfEmail = await users
        .doc(manfUid)
        .get()
        .then((DocumentSnapshot documentSnapshot) => {
              if (documentSnapshot.exists) {documentSnapshot['email']}
            });
    final manfName = await users
        .doc(manfUid)
        .get()
        .then((DocumentSnapshot documentSnapshot) => {
              if (documentSnapshot.exists) {documentSnapshot['name']}
            });

    var manfNamef = manfName.elementAt(0).elementAt(0);
    var manfEmailf = manfEmail.elementAt(0).elementAt(0);
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Sales",
              style: GoogleFonts.ptSerif(fontSize: 18),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$salesName ($salesEmail)"),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.phone_android_rounded,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  icon: Icon(
                    Icons.email_rounded,
                    color: Colors.blue,
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
        Row(
          children: [
            Text(
              "Planning",
              style: GoogleFonts.ptSerif(fontSize: 18),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$planNamef ($planEmailf)"),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.phone_android_rounded,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  icon: Icon(
                    Icons.email_rounded,
                    color: Colors.blue,
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
        Row(
          children: [
            Text(
              "Purchasing",
              style: GoogleFonts.ptSerif(fontSize: 18),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$purchNamef ($purchEmailf)"),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.phone_android_rounded,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  icon: Icon(
                    Icons.email_rounded,
                    color: Colors.blue,
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
        Row(
          children: [
            Text(
              "Manufacturing",
              style: GoogleFonts.ptSerif(fontSize: 18),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$manfNamef ($manfEmailf)"),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.phone_android_rounded,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  icon: Icon(
                    Icons.email_rounded,
                    color: Colors.blue,
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(left: 18, right: 10),
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data;
              }
              return CupertinoActivityIndicator();
            }),
      ),
    );
  }
}
