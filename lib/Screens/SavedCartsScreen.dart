import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/components/SavedCart.dart';
import 'package:grocery_app/constants.dart';
import 'package:provider/provider.dart';

class SavedCarts extends StatefulWidget {
  @override
  _SavedCartsState createState() => _SavedCartsState();
}

class _SavedCartsState extends State<SavedCarts> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Mediator>(context, listen: false);
    final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Saved cart"),
        ),
        body: FirebaseAnimatedList(
            query: _firebaseDatabase
                .reference()
                .child('Saved carts')
                .child("u6FTiZ2nSYSAnbNt2M5LehtGpXz1"),
            itemBuilder: (BuildContext context, DataSnapshot snap,
                Animation<double> animation, int index) {
              Map map = snap.value;

              return SavedCart(
                savedCartName: snap.key,
                totalPrice: "10",
                itemsNumber: snap.value.length.toString(),
              );
            }));
  }
}
