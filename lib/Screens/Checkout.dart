import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/Screens/Home.dart';
import 'package:grocery_app/components/DeliveryType.dart';
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
          children: [
            Container(
              color: Colors.white,
              width: size.width,
              height: size.height * 0.4,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: SvgPicture.asset(
                    "assets/images/method-draw-image.svg",
                  ),
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
                    ProfileCardItem(
                      itemName: "Recipient details",
                      colordata: Colors.purple,
                      icon: Icons.account_circle,
                    ),
                    ProfileCardItem(
                      itemName: "Delivery or Pick up info",
                      colordata: Colors.grey,
                      icon: Icons.local_shipping,
                      toAnotherScreen: () {
                        _showMaterialDialog();
                      },
                    ),
                    ProfileCardItem(
                      itemName: "Payment Method",
                      colordata: Colors.grey,
                      icon: Icons.monetization_on,
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              elevation: 1,
              onPressed: () {},
              color: kPrimaryColor,
              child: Text(
                "Proceed",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => Dialog(
              child: Container(
                height: 280,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.cancel,
                            size: 30,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Select Delivery Type",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: DeliveryType(
                        mainTitle: "Home Delivery",
                        secondTitle: "Within delivery grid",
                        icon: Icons.home,
                        colorData: Colors.orange[300],
                      ),
                    ),
                    GestureDetector(
                      child: DeliveryType(
                        mainTitle: "Pick Up",
                        secondTitle: "Only from our outlets",
                        icon: Icons.shopping_basket,
                        colorData: Colors.orange[900],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
