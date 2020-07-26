import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';

class VegetaleAndFruit extends StatefulWidget {
  final int price;
  final String vegetaleOrFruitName;
  final double resource;

  const VegetaleAndFruit({
    Key key,
    this.price,
    this.vegetaleOrFruitName,
    this.resource,
  }) : super(key: key);

  @override
  _VegetaleAndFruitState createState() => _VegetaleAndFruitState();
}

class _VegetaleAndFruitState extends State<VegetaleAndFruit> {
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
                      "\$${widget.price}",
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
              child: Image.asset(
                "assets/images/carrot.png",
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
                    "Rs. ${widget.resource}",
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
