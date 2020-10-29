import 'package:flutter/material.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/components/MyButton.dart';
import 'package:grocery_app/constants.dart';
import 'package:provider/provider.dart';

class VerifyNumber extends StatefulWidget {
  String _phoneNumber;
  VerifyNumber(String _phoneNumber) {
    this._phoneNumber = _phoneNumber;
  }
  @override
  _VerifyNumberState createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Mediator>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Verify number"),
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
                  "4 digits code were sent to " + widget._phoneNumber,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Flexible(child: TextField()),
                    SizedBox(
                      width: 18,
                    ),
                    Flexible(child: TextField()),
                    SizedBox(
                      width: 18,
                    ),
                    Flexible(child: TextField()),
                    SizedBox(
                      width: 18,
                    ),
                    Flexible(child: TextField()),
                  ],
                ),
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
                    MyButton("VERIFY", () {
                      provider.verifyPhoneNumber(widget._phoneNumber);
                    })
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
