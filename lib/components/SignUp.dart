import 'package:flutter/material.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/Screens/AddNumber.dart';
import 'package:provider/provider.dart';

import 'MyButton.dart';

class SignUp extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    var provider = Provider.of<Mediator>(context, listen: false);  
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcom to Grocery App",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Let's get started",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Username"),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Email address"),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton("NEXT", () {
                  
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddNumber()));
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
