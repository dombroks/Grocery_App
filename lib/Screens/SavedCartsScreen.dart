import 'package:cloud_firestore/cloud_firestore.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Saved cart"),
      ),
      body: StreamBuilder(
          stream: provider.getSavedCarts().onValue,
          builder: (context, userSnapshot) {
            print(userSnapshot.data);
            return userSnapshot.hasData
                ? Text(userSnapshot.data)
                : CircularProgressIndicator();
          }),
    );
  }
}
