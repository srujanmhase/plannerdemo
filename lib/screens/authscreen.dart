import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plannerdemo/bloc/auth.dart';
import 'package:plannerdemo/screens/regscreen.dart';
import 'homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:google_fonts/google_fonts.dart';

class authPage extends StatefulWidget {
  @override
  _authPageState createState() => _authPageState();
}

class _authPageState extends State<authPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nothingController = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: StreamBuilder<dynamic>(
            stream: authBroadcast().stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == "loggedOut") {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black26),
                            height: 50,
                            child: Center(
                              child: Text(
                                "Company",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 80,
                            width: 300,
                            child: Center(
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Manage your task pipeline",
                                      style: GoogleFonts.sourceSerifPro(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "from one place.",
                                      style: GoogleFonts.sourceSerifPro(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 400,
                            width: 300,
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
                                  "Login",
                                  style: GoogleFonts.sourceSerifPro(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Form(
                                      key: _formKey,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 250,
                                              child: TextFormField(
                                                controller: emailController,
                                                decoration: InputDecoration(
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                            borderSide: const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 1.0)),
                                                    enabledBorder:
                                                        const OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width:
                                                                        1.0)),
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
                                              height: 10,
                                            ),
                                            SizedBox(
                                              width: 250,
                                              child: TextFormField(
                                                controller: passwordController,
                                                obscureText: true,
                                                enableSuggestions: false,
                                                autocorrect: false,
                                                decoration: InputDecoration(
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                            borderSide: const BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 1.0)),
                                                    enabledBorder:
                                                        const OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width:
                                                                        1.0)),
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
                                              height: 10,
                                            ),
                                            SizedBox(
                                              width: 250,
                                              child: RoundedLoadingButton(
                                                color: Colors.white,
                                                child: Text('Login',
                                                    style: TextStyle(
                                                        color: Colors.black)),
                                                controller: _btnController,
                                                onPressed: () {
                                                  authSystem(
                                                          emailController,
                                                          passwordController,
                                                          nothingController,
                                                          _btnController,
                                                          nothingController)
                                                      .signIn();
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Center(
                                                child: Text(
                                                  "Or",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          registerPage()),
                                                );
                                              },
                                              child: Container(
                                                  width: 250,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 1),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    "Register Page",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ))),
                                            )
                                          ])),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (snapshot.data == "loggedIn") {
                  return () {
                    Future.delayed(Duration.zero, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => homePage()),
                      );
                    });
                  }();
                }
              } else if (!snapshot.hasData) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (snapshot.error) {
                return Center(
                  child: Text("Something went wrong"),
                );
              }
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }),
      ),
    );
  }
}
