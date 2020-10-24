import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.close,
          color: Colors.grey,
        ),
        title: Text(
          "Change passoword",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Old password"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "New password"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Confirm password"),
              ),
              SizedBox(
                height: 15,
              ),
              SaveButton()
            ],
          ),
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: kPrimaryColor,
      onPressed: () {},
      child: Text(
        "  SAVE  ",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
