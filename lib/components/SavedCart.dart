import 'package:flutter/material.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/components/MyButton.dart';
import 'package:grocery_app/constants.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SavedCart extends StatelessWidget {
  String savedCartName;
  String totalPrice;
  String itemsNumber;

  SavedCart({Key key, this.savedCartName, this.totalPrice, this.itemsNumber})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, top: 8),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      width: 50,
                      height: 50,
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
                          totalPrice,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      onPressed: () {},
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
