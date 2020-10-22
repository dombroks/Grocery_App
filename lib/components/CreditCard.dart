import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditCard extends StatelessWidget {
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
                      onTap: () {},
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
}
