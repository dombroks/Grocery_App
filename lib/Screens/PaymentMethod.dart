import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/Home.dart';
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
        leading: GestureDetector(
          child: Icon(
            Icons.cancel,
            color: Colors.grey,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home(2)));
          },
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(30.0),
          color: Colors.white,
          child: Column(
            children: [
              PaymentMethodItem(
                  paymentCardHolder: "Jessica Alison",
                  paymentCardLogo: "assets/icons/card1.svg"),
              SizedBox(
                height: 10,
              ),
              PaymentMethodItem(
                  paymentCardHolder: "Jessica Alison",
                  paymentCardLogo: "assets/icons/card0.svg"),
              SizedBox(
                height: 10,
              ),
              PaymentMethodItem(
                  paymentCardHolder: "Add Payment method",
                  paymentCardLogo: "assets/icons/credit-card.svg"),
            ],
          )),
    );
  }
}
