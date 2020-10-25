import 'package:flutter/material.dart';
import 'package:grocery_app/components/SignIn.dart';
import 'package:grocery_app/components/SignUp.dart';

import '../constants.dart';

// ignore: must_be_immutable
class AuthScreen extends StatelessWidget {
  String _inOrOut;

  AuthScreen(String _inOrOut) {
    this._inOrOut = _inOrOut;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: TabBar(indicatorColor: kPrimaryColor, tabs: [
              Tab(
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ]),
            actions: [Text("Sign up")],
          ),
          body: TabBarView(children: [
            SignIn(),
            SignUp(),
          ])),
    );
  }
}
