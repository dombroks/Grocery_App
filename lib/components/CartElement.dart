import 'package:flutter/material.dart';

import '../constants.dart';

class cartElement extends StatefulWidget {
  const cartElement({
    Key key,
    this.total,
    this.price,
    this.elementName,
    this.amountPerElement,
    this.amount, this.imageUrl,
  }) : super(key: key);

  final String total;
  final String price;
  final String elementName;
  final String amountPerElement;
  final String amount;
  final String imageUrl ;
  @override
  _cartElementState createState() => _cartElementState();
}

class _cartElementState extends State<cartElement> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: size.width * 0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.network(
                      widget.imageUrl,
                        height: 60,
                        width: 60,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
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
                            "${widget.amountPerElement}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "\$ ${widget.price}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Rs. ${widget.total}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          IconButton(
                            iconSize: 30,
                            icon: Icon(Icons.delete_outline),
                            color: Colors.grey,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${widget.elementName} ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            iconSize: 30,
                            icon: Icon(Icons.remove_circle_outline),
                            color: Colors.grey,
                            onPressed: () {},
                          ),
                          Text(
                            "${widget.amount}Kg",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                          IconButton(
                            iconSize: 30,
                            icon: Icon(Icons.add_circle_outline),
                            color: Colors.grey,
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
