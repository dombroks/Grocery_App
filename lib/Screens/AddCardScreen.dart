import 'package:flutter/material.dart';

class AddCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.close,
          color: Colors.grey,
        ),
        title: Text(
          "Add a card",
        ),
        centerTitle: true,
      ),
    );
  }
}
