import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class notifScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 25, 0, 0),
                    child: Text(
                      "Notifications",
                      style: GoogleFonts.ptSerif(fontSize: 25),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                      "Today",
                      style: GoogleFonts.ptSerifCaption(fontSize: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                  width: 300,
                  height: 180,
                  //clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[200],
                            offset: Offset(0, 0.4),
                            blurRadius: 10,
                            spreadRadius: 2)
                      ]),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "You were assigned a new task",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.withOpacity(0.8),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Xylite Chairs",
                                      style: GoogleFonts.ptSerif(
                                        fontSize: 20,
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  Text("34 Qty",
                                      style: GoogleFonts.roboto(
                                          fontSize: 15, color: Colors.black54)),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text("SKU: XYLITECH0032XA",
                                  style: GoogleFonts.roboto(
                                      fontSize: 17, color: Colors.black54)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Created by user1@sales.com 4hr(s) ago",
                                style: GoogleFonts.roboto(
                                    color: Colors.green.withOpacity(0.7)),
                              ),
                            ],
                          )
                        ],
                      ),
                      Positioned(
                          bottom: 0,
                          child: Container(
                            width: 300,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                              color: Colors.grey[400],
                            ),
                            child: Center(
                              child: Text(
                                "Order Details",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                  width: 300,
                  height: 180,
                  //clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[200],
                            offset: Offset(0, 0.4),
                            blurRadius: 10,
                            spreadRadius: 2)
                      ]),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "You were assigned a new task",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.withOpacity(0.8),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Xylite Chairs",
                                      style: GoogleFonts.ptSerif(
                                        fontSize: 20,
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  Text("34 Qty",
                                      style: GoogleFonts.roboto(
                                          fontSize: 15, color: Colors.black54)),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text("SKU: XYLITECH0032XA",
                                  style: GoogleFonts.roboto(
                                      fontSize: 17, color: Colors.black54)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Created by user1@sales.com 4hr(s) ago",
                                style: GoogleFonts.roboto(
                                    color: Colors.green.withOpacity(0.7)),
                              ),
                            ],
                          )
                        ],
                      ),
                      Positioned(
                          bottom: 0,
                          child: Container(
                            width: 300,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                              color: Colors.grey[400],
                            ),
                            child: Center(
                              child: Text(
                                "Order Details",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                  width: 300,
                  height: 180,
                  //clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[200],
                            offset: Offset(0, 0.4),
                            blurRadius: 10,
                            spreadRadius: 2)
                      ]),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "You were assigned a new task",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.withOpacity(0.8),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Xylite Chairs",
                                      style: GoogleFonts.ptSerif(
                                        fontSize: 20,
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  Text("34 Qty",
                                      style: GoogleFonts.roboto(
                                          fontSize: 15, color: Colors.black54)),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text("SKU: XYLITECH0032XA",
                                  style: GoogleFonts.roboto(
                                      fontSize: 17, color: Colors.black54)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Created by user1@sales.com 4hr(s) ago",
                                style: GoogleFonts.roboto(
                                    color: Colors.green.withOpacity(0.7)),
                              ),
                            ],
                          )
                        ],
                      ),
                      Positioned(
                          bottom: 0,
                          child: Container(
                            width: 300,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                              color: Colors.grey[400],
                            ),
                            child: Center(
                              child: Text(
                                "Order Details",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                  width: 300,
                  height: 180,
                  //clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[200],
                            offset: Offset(0, 0.4),
                            blurRadius: 10,
                            spreadRadius: 2)
                      ]),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "You were assigned a new task",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.withOpacity(0.8),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Xylite Chairs",
                                      style: GoogleFonts.ptSerif(
                                        fontSize: 20,
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  Text("34 Qty",
                                      style: GoogleFonts.roboto(
                                          fontSize: 15, color: Colors.black54)),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text("SKU: XYLITECH0032XA",
                                  style: GoogleFonts.roboto(
                                      fontSize: 17, color: Colors.black54)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Created by user1@sales.com 4hr(s) ago",
                                style: GoogleFonts.roboto(
                                    color: Colors.green.withOpacity(0.7)),
                              ),
                            ],
                          )
                        ],
                      ),
                      Positioned(
                          bottom: 0,
                          child: Container(
                            width: 300,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                              color: Colors.grey[400],
                            ),
                            child: Center(
                              child: Text(
                                "Order Details",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
