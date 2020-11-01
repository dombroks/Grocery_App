import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/Screens/AuthScreen.dart';
import 'package:grocery_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _loadSessionData() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("isLoggedIn");
    if (isLoggedIn) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home(0)),
        ModalRoute.withName('/'),
      );
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      await Provider.of<Mediator>(context, listen: false).fetchData();
      await Provider.of<Mediator>(context, listen: false).fetchCartElements();
    });
    _loadSessionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: kPrimaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/vegetable.svg",
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 25,
            ),
            RaisedButton(
              elevation: 4,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen("In")),
                  ModalRoute.withName('/'),
                );
              },
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 11, horizontal: 31),
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen("Out")),
                  ModalRoute.withName('/'),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 30),
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
