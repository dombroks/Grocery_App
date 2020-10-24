import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditCard extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dom Broks",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.grey,
                        size: 30,
                      ),
                      onTap: () {
                        _showAlertDialg();
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "• • • •  • • • •  • • • •  5467",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Month / Year",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "06 / 2022",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Commercial Bank",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SvgPicture.asset(
                        "assets/icons/card1.svg",
                        width: 50,
                        height: 50,
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showAlertDialg() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Remove card",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          ),
          content: Text(
            "Are you sure you want to remove **** **** **** 6452 card?",
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          ),
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
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
