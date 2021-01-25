import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'updateTasks.dart';

class modifyOrder {
  modifyOrder({this.targetOrder});

  DocumentReference targetOrder;
  String uid = FirebaseAuth.instance.currentUser.uid;
  RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();

  modifyService() async {
    final orderStatus =
        await targetOrder.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        return documentSnapshot['orderState'].toString();
      }
    });

    final userRole = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        return documentSnapshot['userRole'].toString();
      }
    });
    print("$uid");
    print("orderStatus is $orderStatus");
    print("userRole is $userRole");
    if (orderStatus == userRole) {
      return Center(
        child: RoundedLoadingButton(
          child: Text("Mark as Done"),
          controller: btnController,
          onPressed: () {
            if (userRole == 'planning') {
              targetOrder.update({'orderState': 'purchasing'});
              btnController.success();
            } else if (userRole == 'purchasing') {
              targetOrder.update({'orderState': 'manufacturing'});
              btnController.success();
            } else if (userRole == 'manufacturing') {
              targetOrder.update({'orderState': 'done'});
              updateTasks(targetOrder: targetOrder).decTaskService();
              btnController.success();
            }
          },
        ),
      );
    } else {
      return SizedBox(
        height: 0,
      );
    }
  }
}
