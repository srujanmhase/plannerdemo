import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plannerdemo/bloc/orders/modifyOrder.dart';
import 'package:plannerdemo/widgets/paintOrderUsers.dart';

// class orderDetailsScreen extends StatelessWidget {
//   orderDetailsScreen({this.targetOrder});
//   DocumentReference targetOrder;

//   int orderStateInt;

//   paintOrderState(orderState) {
//     if (orderState == 'planning') {
//       orderStateInt = 1;
//     }
//     if (orderState == 'purchasing') {
//       orderStateInt = 2;
//     }
//     if (orderState == 'manufacturing') {
//       orderStateInt = 3;
//     }
//     if (orderState == 'done') {
//       orderStateInt == 4;
//     }
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Column(
//           children: [
//             Container(
//               height: 20,
//               width: 20,
//               color: Colors.green,
//             ),
//             Text("Sales")
//           ],
//         ),
//         Column(
//           children: [
//             Container(
//               height: 20,
//               width: 20,
//               color: () {
//                 if (orderStateInt >= 2) {
//                   return Colors.green;
//                 } else {
//                   return Colors.grey;
//                 }
//               }(),
//             ),
//             Text("Planning")
//           ],
//         ),
//         Column(
//           children: [
//             Container(
//               height: 20,
//               width: 20,
//               color: () {
//                 if (orderStateInt >= 3) {
//                   return Colors.green;
//                 } else {
//                   return Colors.grey;
//                 }
//               }(),
//             ),
//             Text("Purchasing")
//           ],
//         ),
//         Column(
//           children: [
//             Container(
//               height: 20,
//               width: 20,
//               color: () {
//                 if (orderStateInt == 4) {
//                   return Colors.green;
//                 } else {
//                   return Colors.grey;
//                 }
//               }(),
//             ),
//             Text("Manufacturing")
//           ],
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: SafeArea(
//           child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Order Details"),
//                 IconButton(
//                     icon: Icon(Icons.close),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     })
//               ],
//             ),
//             FutureBuilder<Object>(
//                 future: targetOrder.get(),
//                 builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     Map<String, dynamic> data = snapshot.data.data();
//                     return Column(
//                       children: [
//                         paintOrderState(data)
//                       ],
//                     );
//                   }
//                   return CupertinoActivityIndicator();
//                 })
//           ],
//         ),
//       )),
//     );
//   }
// }

class orderDetailsScreen extends StatelessWidget {
  orderDetailsScreen({this.targetOrder});

  final DocumentReference targetOrder;

  int orderStateInt;

  paintOrderState(orderState) {
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
    return FutureBuilder(
      future: targetOrder.get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Material(
            child: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: false,
                    pinned: true,
                    expandedHeight: 300,
                    backgroundColor: Colors.grey[400],
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text("Order Details"),
                      background: Hero(
                          tag: data['itemName'],
                          child: Image(
                            image: AssetImage('assets/pic.jpg'),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  SliverFillRemaining(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${data['itemName']}",
                                  style: GoogleFonts.ptSerif(fontSize: 25)),
                              Text("${data['itemQty']} Qty",
                                  style: GoogleFonts.roboto(
                                      fontSize: 18, color: Colors.black54))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("SKU ${data['itemSKU']}",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16, color: Colors.black54)),
                              SizedBox(
                                height: 6,
                              ),
                              Text("Order ID: XYL56778HG",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16, color: Colors.black54))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: Hero(
                            tag: data['itemSKU'],
                            child: Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey[300],
                                        offset: Offset(1, 1),
                                        blurRadius: 5,
                                        spreadRadius: 2)
                                  ]),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 110,
                                    child: paintOrderState(
                                        data['orderState'].toString()),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(12),
                                              bottomRight:
                                                  Radius.circular(12))),
                                      child: Center(
                                        child: Text(
                                          "${data['orderState'][0].toUpperCase() + data['orderState'].substring(1)}",
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FutureBuilder(
                            future: modifyOrder(targetOrder: targetOrder)
                                .modifyService(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return snapshot.data;
                              }

                              return CupertinoActivityIndicator();
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        paintSales(
                          targetOrder: targetOrder,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }
}
