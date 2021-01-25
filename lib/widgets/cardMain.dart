import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plannerdemo/screens/orderDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class cardListItem extends StatelessWidget {
  String itemName;
  String itemQty;
  String itemSKU;
  String orderState;
  int orderStateInt;
  DocumentReference targetOrderRef;

  cardListItem(
      {this.itemName,
      this.itemQty,
      this.itemSKU,
      this.orderState,
      this.targetOrderRef});

  paintOrderState() {
    if (orderState == 'planning') {
      orderStateInt = 1;
    }
    if (orderState == 'purchasing') {
      orderStateInt = 2;
    }
    if (orderState == 'manufacturing') {
      orderStateInt = 3;
    }
    if (orderState == 'done') {
      orderStateInt == 4;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 3)),
          child: Center(
            child: Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: () {
                    if (orderStateInt >= 2) {
                      return Colors.green;
                    } else {
                      return Colors.grey;
                    }
                  }(),
                  width: 3)),
          child: Center(
            child: () {
              if (orderStateInt >= 2) {
                return Icon(
                  Icons.check,
                  color: Colors.green,
                );
              } else {
                return Icon(
                  Icons.timer,
                  color: Colors.grey,
                );
              }
            }(),
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: () {
                    if (orderStateInt >= 3) {
                      return Colors.green;
                    } else {
                      return Colors.grey;
                    }
                  }(),
                  width: 3)),
          child: Center(
            child: () {
              if (orderStateInt >= 3) {
                return Icon(
                  Icons.check,
                  color: Colors.green,
                );
              } else {
                return Icon(
                  Icons.card_giftcard,
                  color: Colors.grey,
                );
              }
            }(),
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: () {
                    if (orderStateInt == 4) {
                      return Colors.green;
                    } else {
                      return Colors.grey;
                    }
                  }(),
                  width: 3)),
          child: Center(
            child: () {
              if (orderStateInt == 4) {
                return Icon(
                  Icons.check,
                  color: Colors.green,
                );
              } else {
                return Icon(
                  Icons.bubble_chart,
                  color: Colors.grey,
                );
              }
            }(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => orderDetailsScreen(
                        targetOrder: targetOrderRef,
                      )));
        },
        child: SizedBox(
          width: 300,
          height: 300,
          child: Container(
            //width: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                //border: Border.all(color: Colors.black, width: 1),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(3, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ]),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 120,
                      width: double.infinity,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                      child: Hero(
                        tag: itemName,
                        child: Image(
                          image: AssetImage('assets/pic.jpg'),
                          width: 80,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 80,
                      child: Hero(tag: itemSKU, child: paintOrderState()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text("$itemName",
                                style: GoogleFonts.ptSerif(fontSize: 22)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("$itemQty Qty",
                                style: GoogleFonts.roboto(
                                    fontSize: 17, color: Colors.black54)),
                            SizedBox(
                              width: 15,
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "SKU: $itemSKU",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      child: Center(
                        child: Text(
                          "$orderState",
                          style: GoogleFonts.roboto(
                              fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
