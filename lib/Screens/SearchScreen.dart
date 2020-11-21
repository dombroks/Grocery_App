import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: Icon(
          Icons.search,
          color: Colors.white,
        ),
        title: TextField(
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          maxLines: 1,
          decoration: InputDecoration.collapsed(hintText: "Search"),
        ),
        actions: [
          Icon(Icons.mic),
          SizedBox(
            width: 15,
          ),
          GestureDetector(
            child: Icon(Icons.close),
            onTap: () => Navigator.pop(context),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}
