import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: Icon(
          Icons.close,
          color: Colors.grey,
        ),
        title: Text("Change passoword"),
      ),
    );
  }
}
