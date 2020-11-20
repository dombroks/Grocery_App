import 'package:flutter/material.dart';
import 'package:grocery_app/Model/element.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/Screens/SavedCartsDetailsScreen.dart';
import 'package:grocery_app/components/MyButton.dart';
import 'package:grocery_app/constants.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SavedCart extends StatelessWidget {
  String savedCartName;
  String totalPrice;
  String itemsNumber;
  List<element> elements;

  SavedCart(
      {Key key,
      this.savedCartName,
      this.totalPrice,
      this.itemsNumber,
      this.elements})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9.0, right: 9, top: 8),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 175,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        Provider.of<Mediator>(context, listen: false)
                            .deleteSavedCart(savedCartName);
                      },
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          savedCartName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          "Price: \$ $totalPrice",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Total items: $itemsNumber",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SavedCartsDetailsScreen(elements,totalPrice)));
                      },
                      child: Text(
                          "VIEW CART",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    MyButton("CHECK OUT", () {})
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
