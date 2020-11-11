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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor,
                      ),
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
