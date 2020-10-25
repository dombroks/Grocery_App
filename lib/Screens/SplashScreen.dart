import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/Screens/AuthScreen.dart';
import 'package:grocery_app/constants.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      Provider.of<Mediator>(context, listen: false).fetchData();
      Provider.of<Mediator>(context, listen: false).fetchCartElements();
    });
    /*
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home(0))));
            */
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AuthScreen("In")));
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
              onPressed: () {},
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
