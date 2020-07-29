import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';

class VegetaleAndFruit extends StatefulWidget {
  final double price;
  final String vegetaleOrFruitName;
  final double resource;
  final String imageUrl;

  const VegetaleAndFruit({
    Key key,
    this.price,
    this.vegetaleOrFruitName,
    this.resource,
    this.imageUrl,
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
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/grocery-app-2c74b.appspot.com/o/Fruits%26Vegetables%2FFruits%26Vegetables%2Fstrawberry.png?alt=media&token=23cdd7d9-c629-4233-85aa-664b384211f2",
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
