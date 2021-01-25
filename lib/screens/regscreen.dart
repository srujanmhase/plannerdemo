import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plannerdemo/bloc/auth.dart';
import 'package:flutter/material.dart';
import 'package:plannerdemo/screens/authscreen.dart';
import 'homescreen.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class registerPage extends StatefulWidget {
  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  Key _registerFormKey = GlobalKey<FormState>();
  final _remailcontroller = TextEditingController();
  final _rpwrdcontroller = TextEditingController();
  final _roleController = TextEditingController();
  final _nameController = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  @override
  void dispose() {
    _remailcontroller.dispose();
    _rpwrdcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: authBroadcast().stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == "loggedIn") {
              return () {
                Future.delayed(Duration.zero, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homePage()),
                  );
                });
              }();
            } else if (snapshot.data == "loggedOut") {
              return Material(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 600,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xff0029FF).withOpacity(0.8),
                                Color(0xff00F0FF).withOpacity(0.8),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Register New Employee",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                                key: _registerFormKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      child: TextFormField(
                                        controller: _remailcontroller,
                                        decoration: InputDecoration(
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.white,
                                                            width: 1.0)),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.white,
                                                            width: 1.0)),
                                            labelText: 'Email',
                                            labelStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6))),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter email';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: TextFormField(
                                        controller: _rpwrdcontroller,
                                        obscureText: true,
                                        enableSuggestions: false,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.white,
                                                            width: 1.0)),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.white,
                                                            width: 1.0)),
                                            labelText: 'Password',
                                            labelStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6))),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter password';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: TextFormField(
                                        controller: _roleController,
                                        decoration: InputDecoration(
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.white,
                                                            width: 1.0)),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.white,
                                                            width: 1.0)),
                                            labelText:
                                                'Employee role eg. Sales',
                                            labelStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6))),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'enter role';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: TextFormField(
                                        controller: _nameController,
                                        decoration: InputDecoration(
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.white,
                                                            width: 1.0)),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.white,
                                                            width: 1.0)),
                                            labelText: 'Name',
                                            labelStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6))),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'enter name';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: RoundedLoadingButton(
                                        color: Colors.white,
                                        child: Text('Register new user',
                                            style:
                                                TextStyle(color: Colors.black)),
                                        controller: _btnController,
                                        onPressed: () {
                                          authSystem(
                                                  _remailcontroller,
                                                  _rpwrdcontroller,
                                                  _roleController,
                                                  _btnController,
                                                  _nameController)
                                              .register();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Or",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 250,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Center(
                                              child: Text(
                                            "Back to Login",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                        ))
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
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
        });
  }
}
