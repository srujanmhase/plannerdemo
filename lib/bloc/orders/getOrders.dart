import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plannerdemo/widgets/cardMain.dart';
import 'package:flutter/cupertino.dart';

class yCardsStream extends StatelessWidget {
  //yCardsStream({this.uid});

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    CollectionReference universalordercol =
        FirebaseFirestore.instance.collection('orders');
    CollectionReference privateorderlist = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('orders');
    return StreamBuilder(
        stream: privateorderlist.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CupertinoActivityIndicator());
          }

          return ListView(
            primary: false,
            shrinkWrap: true,
            children: (snapshot.data.docs.length == 0)
                ? noData
                : snapshot.data.docs.map((e) {
                    // print('DOUMENT ID  ----> ${e.id}');
                    // return new Text("data");
                    String docid = e.id;
                    DocumentReference targetOrder =
                        universalordercol.doc(docid);
                    print("PRIVATE DOCUMENT ID IS //// $docid");
                    // String uid = FirebaseAuth.instance.currentUser.uid;
                    // print(uid);
                    //return new Text("data");
                    return new cardListItemPainter(targetOrder: targetOrder);
                  }).toList(),
          );
        });
  }
}

List<Widget> noData = [
  Center(
    child: Text("No tasks yet"),
  )
];

class cardListItemPainter extends StatelessWidget {
  cardListItemPainter({this.targetOrder});

  final DocumentReference targetOrder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: targetOrder.get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return cardListItem(
            itemName: data['itemName'],
            itemQty: data['itemQty'],
            itemSKU: data['itemSKU'],
            orderState: data['orderState'],
            targetOrderRef: targetOrder,
          );
        }

        return Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }
}
