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
          stream: provider.getSavedCarts(),
          builder: (context, userSnapshot) {
            return userSnapshot.hasData
                ? ListView.builder(
                    itemCount: userSnapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot userData =
                          userSnapshot.data.documents[index];
                      return SavedCart(
                          savedCartName: userData.data["amount"],
                          totalPrice: "111",
                          itemsNumber: "10");
                    })
                : CircularProgressIndicator();
          }),
    );
  }
}
