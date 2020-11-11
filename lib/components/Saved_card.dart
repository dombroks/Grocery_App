import 'package:flutter/material.dart';
import 'package:grocery_app/components/MyButton.dart';
import 'package:grocery_app/constants.dart';

class Saved_card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 4,
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
                          "Vegetables",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          "Subtotal : 1,820.00",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Total items: 04",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.delete_outline,
                      color: Colors.grey,
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
