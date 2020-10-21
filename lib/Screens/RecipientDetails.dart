import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';

class RecipientDatails extends StatefulWidget {
  @override
  _RecipientDatailsState createState() => _RecipientDatailsState();
}

class _RecipientDatailsState extends State<RecipientDatails> {
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
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          width: 90,
                          height: 90,
                          child: _image == null
                              ? Icon(
                                  Icons.camera_alt,
                                  color: kPrimaryColor,
                                  size: 40,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.file(
                                    _image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                      onTap: () {
                        getImage();
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(),
                SizedBox(
                  height: 25,
                ),
                TextField(),
                SizedBox(
                  height: 25,
                ),
                Row(
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
                    Flexible(child: TextField()),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RaisedButton(
                      onPressed: () {},
                      color: kPrimaryColor,
                      child: Text(
                        "SAVE",
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

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("NO selected image !!");
      }
    });
  }
}
