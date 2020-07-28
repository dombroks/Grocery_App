import 'package:flutter/material.dart';
import 'package:grocery_app/components/CartElement.dart';


class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: double.infinity,
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          Container(
            width: size.width,
            height: size.height * 0.12,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Subtotal (4 items)",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rs. 1820.00",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Promotion discounts",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        "Rs. -220.00",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
         
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    cartElement(
                      total: 940.00,
                      elementName: "Broccli",
                      amountPerElement: 1,
                      price: 200.0,
                      amount: 4,
                    ),
                    cartElement(
                      total: 940.00,
                      elementName: "Broccli",
                      amountPerElement: 1,
                      price: 200.0,
                      amount: 4,
                    ),
                    cartElement(
                      total: 940.00,
                      elementName: "Broccli",
                      amountPerElement: 1,
                      price: 200.0,
                      amount: 4,
                    ),
                    cartElement(
                      total: 940.00,
                      elementName: "Broccli",
                      amountPerElement: 1,
                      price: 200.0,
                      amount: 4,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
