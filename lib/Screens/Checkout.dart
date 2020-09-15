import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/Screens/Home.dart';
import 'package:grocery_app/components/ProfileCardItem.dart';
import 'package:grocery_app/constants.dart';

import 'PaymentMethod.dart';

class checkoutScreen extends StatefulWidget {
  @override
  _checkoutScreenState createState() => _checkoutScreenState();
}

class _checkoutScreenState extends State<checkoutScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Checkout",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home(1)));
          },
        ),
      ),
      body: Container(
        color: kGreyColor,
        width: size.width,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              width: size.width,
              height: size.height * 0.25,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SvgPicture.asset(
                    "assets/images/method-draw-image.svg",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, top: 20),
              child: Text(
                "Checkout details",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: kGreyColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: ProfileCardItem(
                        itemName: "Recipient details",
                        colordata: Colors.purple,
                        icon: Icons.account_circle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: ProfileCardItem(
                        itemName: "Delivery or Pick up info",
                        colordata: Colors.blue,
                        icon: Icons.local_shipping,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: ProfileCardItem(
                        itemName: "Payment Method",
                        colordata: Colors.green,
                        icon: Icons.monetization_on,
                        toAnotherScreen: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentMethod()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
