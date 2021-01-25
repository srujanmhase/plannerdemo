import 'package:flutter/material.dart';
import 'package:plannerdemo/bloc/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class dbinitInterface {
  String _emailController;
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _roleController = new TextEditingController();
  String _nameController;

  UserCredential userCredential;

  dbinitInterface(this._emailController, this._passwordController,
      this._roleController, this.userCredential, this._nameController);

  Future initializeUser() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference userDoc =
          firestore.collection('users').doc(userCredential.user.uid);
      CollectionReference sales = firestore.collection('sales');
      CollectionReference planning = firestore.collection('planning');
      CollectionReference purchasing = firestore.collection('purchasing');
      CollectionReference manufacturing = firestore.collection('manufacturing');

      if (_roleController.text == 'sales') {
        final setSalesPrim = await userDoc.set({
          'userRole': 'sales',
          'email': '${this._emailController}',
          'name': '${this._nameController}'
        });
        final setSalesSec =
            await sales.doc(userCredential.user.uid).set({'tasks': 0});
        setSalesPrim;
        setSalesSec;
      } else if (_roleController.text == 'planning') {
        final setPlanPrim = await userDoc.set({
          'userRole': 'planning',
          'email': '${this._emailController}',
          'name': '${this._nameController}'
        });
        final setPlanSec =
            await planning.doc(userCredential.user.uid).set({'tasks': 0});
        setPlanPrim;
        setPlanSec;
      } else if (_roleController.text == 'purchasing') {
        final setPurchPrim = await userDoc.set({
          'userRole': 'purchasing',
          'email': '${this._emailController}',
          'name': '${this._nameController}'
        });
        final setPurchSec =
            await purchasing.doc(userCredential.user.uid).set({'tasks': 0});
        setPurchPrim;
        setPurchSec;
      } else if (_roleController.text == 'manufacturing') {
        final setManfPrim = await userDoc.set({
          'userRole': 'manufacturing',
          'email': '${this._emailController}',
          'name': '${this._nameController}'
        });
        final setManfSec =
            await manufacturing.doc(userCredential.user.uid).set({'tasks': 0});
        setManfPrim;
        setManfSec;
      }
    } catch (error) {
      print(error);
    }
    ;
  }
}

class taskInterface {}
