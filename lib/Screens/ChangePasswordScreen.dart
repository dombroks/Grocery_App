import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.close,
          color: Colors.grey,
        ),
        title: Text("Change passoword"),
      ),
    );
  }
}
