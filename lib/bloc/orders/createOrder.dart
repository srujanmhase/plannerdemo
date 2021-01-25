import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:plannerdemo/bloc/orders/updateTasks.dart';
import 'package:uuid/uuid.dart';
import 'dart:collection';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class addOrderService {
  addOrderService({
    this.itemName,
    this.itemQty,
    this.itemSKU,
    this.salesPersonnel,
    this.btnController,
  });

  final String itemName;
  final String itemQty;
  final String itemSKU;
  final String salesPersonnel;

  RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();

  String planPersonnel;
  String purchPersonnel;
  String manfPersonnel;

  DateTime createdOn;

  final Map<String, dynamic> planningTasks = new Map();
  final Map<String, dynamic> purchasingTasks = new Map();
  final Map<String, dynamic> manufacturingTasks = new Map();

  var uuid = Uuid();

  Future addCard() async {
    try {
      String uid = FirebaseAuth.instance.currentUser.uid;
      CollectionReference universalordercol =
          FirebaseFirestore.instance.collection('orders');
      CollectionReference privateorderlist = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('orders');

      final getPlanning = await FirebaseFirestore.instance
          .collection('planning')
          .get()
          .then((QuerySnapshot querySnapshot) => {
                querySnapshot.docs.forEach((doc) {
                  print("bzz");
                  print(doc['tasks']);
                  print(doc.id);
                  //planningTasks[doc.id] = doc['tasks'];
                  planningTasks.putIfAbsent(doc.id, () => doc['tasks']);
                  print("bzz2");
                })
              });

      final getPurchasing = await FirebaseFirestore.instance
          .collection('purchasing')
          .get()
          .then((QuerySnapshot querySnapshot) => {
                querySnapshot.docs.forEach((doc) {
                  purchasingTasks[doc.id] = doc['tasks'];
                })
              });

      final getManufacturing = await FirebaseFirestore.instance
          .collection('manufacturing')
          .get()
          .then((QuerySnapshot querySnapshot) => {
                querySnapshot.docs.forEach((doc) {
                  manufacturingTasks[doc.id] = doc['tasks'];
                })
              });

      setPlanning() {
        getPlanning;
        var sortedKeys = planningTasks.keys.toList(growable: false)
          ..sort((k1, k2) => planningTasks[k1].compareTo(planningTasks[k2]));
        Map sortedMap = new Map.fromIterable(sortedKeys,
            key: (k) => k, value: (k) => planningTasks[k]);

        List<String> _keyList = new List();
        for (String key in sortedMap.keys) {
          _keyList.add(key);
        }
        planPersonnel = _keyList[0];
      }

      setPurchasing() {
        getPurchasing;

        var sortedKeys = purchasingTasks.keys.toList(growable: false)
          ..sort(
              (k1, k2) => purchasingTasks[k1].compareTo(purchasingTasks[k2]));
        Map sortedMap = new Map.fromIterable(sortedKeys,
            key: (k) => k, value: (k) => purchasingTasks[k]);

        List<String> _keyList = new List();
        for (String key in sortedMap.keys) {
          _keyList.add(key);
        }

        purchPersonnel = _keyList[0];
      }

      setManufacturing() {
        getManufacturing;

        var sortedKeys = manufacturingTasks.keys.toList(growable: false)
          ..sort((k1, k2) =>
              manufacturingTasks[k1].compareTo(manufacturingTasks[k2]));
        Map sortedMap = new Map.fromIterable(sortedKeys,
            key: (k) => k, value: (k) => manufacturingTasks[k]);

        List<String> _keyList = new List();
        for (String key in sortedMap.keys) {
          _keyList.add(key);
        }

        manfPersonnel = _keyList[0];
      }

      setPlanning();
      setPurchasing();
      setManufacturing();
      createdOn = DateTime.now();

      String cuuid = uuid.v4();

      final setuniversalValue = await universalordercol.doc(cuuid).set({
        'itemName': '${this.itemName}',
        'itemQty': '${this.itemQty}',
        'itemSKU': '${this.itemSKU}',
        'orderState': 'planning',
        'salesPersonnel': '${this.salesPersonnel}',
        'planPersonnel': '${planPersonnel}',
        'purchPersonnel': '${purchPersonnel}',
        'manfPersonnel': '${manfPersonnel}',
        'createdOn': '${createdOn}',
      });
      setuniversalValue;

      final setprivateList =
          await privateorderlist.doc(cuuid).set({'exists': true});
      setprivateList;

      final setPlanPersonnelPrivateList = FirebaseFirestore.instance
          .collection('users')
          .doc(planPersonnel)
          .collection('orders')
          .doc(cuuid)
          .set({'exists': true});

      final setPurchPersonnelPrivateList = FirebaseFirestore.instance
          .collection('users')
          .doc(purchPersonnel)
          .collection('orders')
          .doc(cuuid)
          .set({'exists': true});

      final setManfPersonnelPrivateList = FirebaseFirestore.instance
          .collection('users')
          .doc(manfPersonnel)
          .collection('orders')
          .doc(cuuid)
          .set({'exists': true});

      setPlanPersonnelPrivateList;
      setPurchPersonnelPrivateList;
      setManfPersonnelPrivateList;
      incTaskService(
          salesPersonnel, planPersonnel, purchPersonnel, manfPersonnel);
      btnController.success();
    } catch (error) {
      print(error);
    }
  }
}
