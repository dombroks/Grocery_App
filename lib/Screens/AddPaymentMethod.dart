import 'package:flutter/material.dart';
import 'package:grocery_app/components/AddCard.dart';
import 'package:grocery_app/components/CreditCard.dart';

import 'package:grocery_app/constants.dart';

class AddPaymentMethod extends StatefulWidget {
  @override
  _AddPaymentMethodState createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text("Add a payment method"),
        centerTitle: true,
      ),
      body: Container(

        child: CreditCard(),
      ),
    );
  }
}
