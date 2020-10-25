import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign in to Grocery App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
