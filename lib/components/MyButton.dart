import 'package:flutter/material.dart';

import '../constants.dart';

class MyButton extends StatelessWidget {
  String opt;
  Function job;
  MyButton(String opt, Function job) {
    this.opt = opt;
    this.job = job;
  }
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: kPrimaryColor,
      onPressed: () {
        job();
      },
      child: Text(
        "$opt",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
