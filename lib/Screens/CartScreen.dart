import 'package:flutter/material.dart';
import 'package:grocery_app/Model/Cart.dart';
import 'package:grocery_app/Model/Fruit.dart';
import 'package:grocery_app/components/CartElement.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartElements = Provider.of<List<Cart>>(context);
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
                child: ListView.builder(
                  itemCount: cartElements.length,
                  itemBuilder: (context, index) {
                    Cart cart = cartElements[index];
                    return cartElement(
                      imageUrl: cart.image,
                      total: '940.00',
                      elementName: cart.name,
                      amountPerElement: cart.amount,
                      price: cart.price,
                      amount: '4',
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
