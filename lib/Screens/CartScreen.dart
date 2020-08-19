import 'package:flutter/material.dart';
import 'package:grocery_app/Model/element.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/components/CartElement.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Mediator>(context);

    var cartData = provider.cartElements;

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
                        "Subtotal (${cartData.length} items)",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$ ${provider.totalPrice}",
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
                        "- \$ 220.00",
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
                  itemCount: cartData.length,
                  itemBuilder: (context, index) {
                    element cart = cartData[index];
                    return cartElement(
                      imageUrl: cart.image,
                      total: '940.00',
                      elementName: cart.name,
                      amountPerElement: cart.amount,
                      price: cart.price,
                      amount: '1',
                      increaseOrDecreaseAmount: () async {
                        await provider.increaseOrDecreaseAmount(
                            cart, "increase");
                      },
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
