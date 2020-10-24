import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';

class TermsConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: Icon(
          Icons.close,
          color: Colors.white,
        ),
        title: Text("Terms & conditions"),
      ),
      body: Container(
        child: Column(),
      ),
    );
  }
}
