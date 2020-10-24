import 'package:flutter/material.dart';

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
                decoration: InputDecoration(hintText: ""),
              ),
              TextField(
                decoration: InputDecoration(hintText: ""),
              ),
              TextField(
                decoration: InputDecoration(hintText: ""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
