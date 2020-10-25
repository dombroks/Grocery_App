import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/Screens/Home.dart';
import 'package:grocery_app/Screens/PaymentMethod.dart';
import 'package:grocery_app/Screens/RecipientDetails2.dart';
import 'package:grocery_app/components/MyButton.dart';
import 'package:grocery_app/components/PickUpDialog.dart';
import 'package:grocery_app/components/ProfileCardItem.dart';
import 'package:grocery_app/constants.dart';

class checkoutScreen extends StatefulWidget {
  @override
  _checkoutScreenState createState() => _checkoutScreenState();
}

class _checkoutScreenState extends State<checkoutScreen> {
  @override
  void initState() {
    super.initState();
  }

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
                    GestureDetector(
                      child: ProfileCardItem(
                        itemName: "Recipient details",
                        colordata: Colors.purple,
                        icon: Icons.account_circle,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecipientDetails2()));
                      },
                    ),
                    GestureDetector(
                      child: ProfileCardItem(
                        itemName: "Delivery or Pick up info",
                        colordata: Colors.grey,
                        icon: Icons.local_shipping,
                        toAnotherScreen: () {
                          _showDialog();
                        },
                      ),
                      onTap: () {
                        _showDialog();
                      },
                    ),
                    GestureDetector(
                      child: ProfileCardItem(
                        itemName: "Payment Method",
                        colordata: Colors.grey,
                        icon: Icons.monetization_on,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentMethod()));
                      },
                    ),
                  ],
                ),
              ),
            ),
            MyButton("Proceed",(){})
          ],
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return MyDialog();
      },
    );
  }
}
