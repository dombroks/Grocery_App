import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/Viewmodel/SharedViewModel.dart';
import 'package:provider/provider.dart';

class CreditCard extends StatefulWidget {
  String name;
  String number;
  String cvv;
  String month;
  String year;

  CreditCard({Key key, this.name, this.number, this.cvv, this.month, this.year})
      : super(key: key);
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
            height: 158,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.grey,
                        size: 25,
                      ),
                      onTap: () {
                        _showAlertDialg(widget.number);
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.number,
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
                  "${widget.month} / ${widget.year}",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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

  _showAlertDialg(String cardNumber) {
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
                await Provider.of<SharedViewModel>(context, listen: false)
                    .deleteCreditCard(cardNumber);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
