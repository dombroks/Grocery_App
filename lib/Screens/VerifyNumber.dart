import 'package:flutter/material.dart';
import 'package:grocery_app/components/MyButton.dart';
import 'package:grocery_app/constants.dart';

class VerifyNumber extends StatefulWidget {
  @override
  _VerifyNumberState createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Add number"),
      ),
      body: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Container(
            width: double.infinity,
            height: 208,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Verify your number",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "4 digits code sent to +213 65 82 02 27 11",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Resend",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    MyButton("VERIFY", () {})
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
