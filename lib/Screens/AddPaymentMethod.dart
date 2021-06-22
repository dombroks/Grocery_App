import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/AddCardScreen.dart';
import 'package:grocery_app/Viewmodel/SharedViewModel.dart';
import 'package:grocery_app/components/CreditCard.dart';
import 'package:grocery_app/constants.dart';
import 'package:provider/provider.dart';

class AddPaymentMethod extends StatefulWidget {
  @override
  _AddPaymentMethodState createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SharedViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              child: Icon(
                Icons.add,
                size: 26,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCardScreen()));
              },
            ),
          )
        ],
        backgroundColor: kPrimaryColor,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Payment method"),
        centerTitle: true,
      ),
      body: FirebaseAnimatedList(
          defaultChild: Center(
            child: CircularProgressIndicator(),
          ),
          query: provider.getCreditCards(),
          itemBuilder: (BuildContext context, DataSnapshot snap,
              Animation<double> animation, int index) {
            Map map = snap.value;

            return CreditCard(
                name: map.entries.elementAt(2).value,
                number: map.entries.elementAt(0).value,
                cvv: map.entries.elementAt(1).value,
                month: map.entries.elementAt(3).value,
                year: map.entries.elementAt(4).value);
          }),
    );
  }
}
