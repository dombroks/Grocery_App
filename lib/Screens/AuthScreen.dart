import 'package:flutter/material.dart';
import 'package:grocery_app/components/SignIn.dart';
import 'package:grocery_app/components/SignUp.dart';

// ignore: must_be_immutable
class AuthScreen extends StatelessWidget {
  String _inOrOut;
  AuthScreen(String _inOrOut) {
    this._inOrOut = _inOrOut;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 0),
              child: Text(
                "Sign in",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 0),
              child: Text(
                "Sign up",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ],
        ),
        actions: [Text("Sign up")],
      ),
      body: (_inOrOut == "In") ? SignIn() : SignUp(),
    );
  }
}
