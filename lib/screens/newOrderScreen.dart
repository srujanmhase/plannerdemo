import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plannerdemo/bloc/orders/createOrder.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:google_fonts/google_fonts.dart';

class newOrderForm extends StatefulWidget {
  @override
  _newOrderFormState createState() => _newOrderFormState();
}

class _newOrderFormState extends State<newOrderForm> {
  TextEditingController itemName = new TextEditingController();
  TextEditingController itemQty = new TextEditingController();
  TextEditingController itemSKU = new TextEditingController();
  RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Icon(Icons.close),
                            SizedBox(
                              width: 6,
                            ),
                            Text("Back"),
                            SizedBox(
                              width: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Add a new Order",
                  style: GoogleFonts.sourceSerifPro(
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 280,
                  child: TextFormField(
                    controller: itemName,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Item Name'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 280,
                  child: TextFormField(
                    controller: itemQty,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Item Quantity'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 280,
                  child: TextFormField(
                    controller: itemSKU,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Item SKU'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 280,
                  child: RoundedLoadingButton(
                    controller: btnController,
                    onPressed: () {
                      addOrderService(
                              itemName: itemName.text,
                              itemQty: itemQty.text,
                              itemSKU: itemSKU.text,
                              salesPersonnel:
                                  FirebaseAuth.instance.currentUser.uid,
                              btnController: btnController)
                          .addCard();
                    },
                    child: Text(
                      "Add a new Order",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
