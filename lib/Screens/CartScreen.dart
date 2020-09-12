import 'package:flutter/material.dart';
import 'package:grocery_app/Model/element.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/components/CartElement.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    var provider = Provider.of<Mediator>(context, listen: false);

    provider.fetchCartElements();
    if (!provider.totalPriceIsLoaded) {
      provider.getCartElementsTotalPrice();
    }
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Mediator>(context, listen: true);

    var cartData = provider.cartElements;
    var totalPrice = provider.totalPrice;

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
                        "\$ $totalPrice",
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
                      amount: cart.amountForBuying.toString(),
                      increaseAmount: () async {
                        await provider.increaseAmount(cart);
                      },
                      decreaseAmount: () async {
                        await provider.decreaseAmount(cart);
                      },
                      deleteElement: () async {
                        await provider.deleteElementFromCart(cart);
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
