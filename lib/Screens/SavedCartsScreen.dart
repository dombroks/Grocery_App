import 'package:firebase_database/firebase_database.dart';
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
      body: StreamBuilder(
          stream: _firebaseDatabase
              .reference()
              .child("Saved carts")
              .child("u6FTiZ2nSYSAnbNt2M5LehtGpXz1")
              .limitToFirst(10)
              .onValue,
          builder: (context, userSnapshot) {

            
            return userSnapshot.hasData
                ? ListView.builder(
                    itemCount: userSnapshot.data.snapshot.value.length,
                    itemBuilder: (context, index) {
                      return SavedCart(
                        savedCartName:
                            userSnapshot.data.snapshot.value[0].toString(),
                        totalPrice: "10",
                      );
                    },
                  )
                : CircularProgressIndicator();
          }),
    );
  }
}
