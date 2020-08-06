import 'package:flutter/material.dart';
import 'package:grocery_app/Model/Fruit.dart';
import 'package:grocery_app/Services/firebaseFirestore.dart';
import 'package:grocery_app/constants.dart';

class VegetaleAndFruit extends StatefulWidget {
  final String price;
  final String vegetaleOrFruitName;
  final String amount;
  final String imageUrl;
  final Function uploadToCart;

  const VegetaleAndFruit({
    Key key,
    this.price,
    this.vegetaleOrFruitName,
    this.imageUrl,
    this.amount,
    this.uploadToCart,
  }) : super(key: key);

  @override
  _VegetaleAndFruitState createState() => _VegetaleAndFruitState();
}

class _VegetaleAndFruitState extends State<VegetaleAndFruit> {
  final firebaseFirestore _firestore = firebaseFirestore();
  Color _iconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 160,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: 36,
                    height: 18,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "${widget.amount}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_basket),
                    color: _iconColor,
                    onPressed: () {
                      setState(() {
                        if (_iconColor == kPrimaryColor) {
                          _iconColor = Colors.grey;
                        } else {
                          widget.uploadToCart();
                          _iconColor = kPrimaryColor;
                        }
                      });
                    },
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              width: 100,
              child: Image.network(
                widget.imageUrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    widget.vegetaleOrFruitName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: <Widget>[
                  Text(
                    "Rs. ${widget.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
