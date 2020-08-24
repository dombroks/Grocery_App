import 'package:flutter/material.dart';
import 'package:grocery_app/components/PaymentMethodItem.dart';
import 'package:grocery_app/constants.dart';

class PaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment methods",
          style: TextStyle(color: kPrimaryColor),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.cancel,
          color: Colors.grey,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        color: Colors.white,
        child: PaymentMethodItem(),
      ),
    );
  }
}
