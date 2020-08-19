import 'dart:async';

import "package:flutter/material.dart";
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/Screens/Home.dart';
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
      
    });
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => home())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
      ),
    );
  }
}
