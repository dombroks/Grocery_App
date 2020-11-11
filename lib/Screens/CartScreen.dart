import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/Model/element.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/Screens/Checkout.dart';
import 'package:grocery_app/Screens/SaveCart.dart';
import 'package:grocery_app/components/CartElement.dart';
import 'package:grocery_app/constants.dart';
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
    bool checkoutButtonVisibility = false;
    var provider = Provider.of<Mediator>(context, listen: true);

    var cartData = provider.cartElements;
    var totalPrice = provider.totalPrice;

    // ignore: prefer_is_not_empty
    if (!(cartData.isEmpty)) checkoutButtonVisibility = true;

    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: double.infinity,
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          Container(
            width: size.width,
            height: size.height * 0.18,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Visibility(
                        visible: cartData.isNotEmpty,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SaveCart()));
                          },
                          child: Text(
                            "  SAVE CART  ",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Visibility(
                        visible: cartData.isNotEmpty,
                        child: RaisedButton(
                          color: kPrimaryColor,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => checkoutScreen()));
                          },
                          child: Text(
                            "  CHECK OUT  ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: (cartData.isEmpty)
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/empty_cart.svg",
                              width: 200.0,
                              height: 200.0,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Your shopping cart is empty",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    : ListView.builder(
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
                              _showMaterialDialog(cart);
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

  _showMaterialDialog(element e) {
    String elementName = e.name.toUpperCase();
    var provider = Provider.of<Mediator>(context, listen: false);

    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Remove an item")
                ],
              ),
              content: new Text(
                  "Are you sure you want to remove $elementName from your shopping cart ?"),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'No',
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  color: Colors.red,
                  child: Text('Remove'),
                  onPressed: () async {
                    await provider.deleteElementFromCart(e);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
