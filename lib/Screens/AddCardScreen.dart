import 'package:flutter/material.dart';

class AddCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.close,
          color: Colors.grey,
        ),
        title: Text(
          "Add a card",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Card holder name"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Card number"),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
