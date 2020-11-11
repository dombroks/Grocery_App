import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            height: 190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vegetables",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Subtotal : 1,820.00",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Total items: 04",
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
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
}
