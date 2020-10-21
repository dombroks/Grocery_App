import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';

class RecipientDetails2 extends StatefulWidget {
  @override
  _RecipientDetails2State createState() => _RecipientDetails2State();
}

class _RecipientDetails2State extends State<RecipientDetails2> {
  File _image;
  final picker = ImagePicker();
  String _firstCountryPrefix = "+213";
  List<String> _countriesPrefixs = ["+213", "+01", "+43"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: 800,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      "Recipient details",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            shape: BoxShape.circle,
                          ),
                          width: 65,
                          height: 65,
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter recipient",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("One who recieves shopping items")
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    contentPadding: EdgeInsets.all(0),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DropdownButton(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: kPrimaryColor,
                      ),
                      value: _firstCountryPrefix,
                      items: _countriesPrefixs.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _firstCountryPrefix = newValue;
                        });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                        child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration:
                          InputDecoration(hintText: "Your mobile number"),
                    )),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "SAVE",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: kPrimaryColor,
                      child: Text(
                        "NEXT",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
