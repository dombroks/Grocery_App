import 'package:flutter/material.dart';

import '../constants.dart';

class MyButton extends StatelessWidget {
  String opt;
  MyButton(String opt) {
    this.opt = opt;
  }
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: kPrimaryColor,
      onPressed: () {},
      child: Text(
        "  SAVE  ",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
