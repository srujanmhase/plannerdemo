import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plannerdemo/bloc/db.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class authSystem {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _roleController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  authSystem(this._emailController, this._passwordController,
      this._roleController, this._btnController, this._nameController);

  void signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      _btnController.success();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void register() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      dbinitInterface(_emailController.text, _passwordController,
              _roleController, userCredential, _nameController.text)
          .initializeUser();
      _btnController.success();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}

class authBroadcast {
  authBroadcast() {
    StreamSubscription authStream =
        FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user != null) {
        _authState.sink.add("loggedIn");
      } else {
        _authState.sink.add("loggedOut");
      }
    });
  }
  final _authState = StreamController();
  Stream get stream => _authState.stream;
}
