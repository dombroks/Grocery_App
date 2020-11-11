import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class RecipientDatails extends StatefulWidget {
  @override
  _RecipientDatailsState createState() => _RecipientDatailsState();
}

class _RecipientDatailsState extends State<RecipientDatails> {
  File _image;
  final picker = ImagePicker();
  String _firstCountryPrefix = "+213";
  List<String> _countriesPrefixs;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    phoneNumberController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Provider.of<Mediator>(context, listen: false).getContriesPrefixCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Mediator>(context, listen: true);
    _countriesPrefixs =
        Provider.of<Mediator>(context, listen: false).prefixCodes;

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
                            border: Border.all(
                              color: kPrimaryColor,
                            ),
                            shape: BoxShape.circle,
                          ),
                          width: 90,
                          height: 90,
                          child: provider.profileImageUrl == null
                              ? Icon(
                                  Icons.camera_alt,
                                  color: kPrimaryColor,
                                  size: 40,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    provider.profileImageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                      onTap: () {
                        getImage().whenComplete(
                            () => provider.uploadProfileImageToStorage(_image));
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Text("Change profile picture"),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(hintText: provider.username),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: provider.email),
                ),
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
                      items: _countriesPrefixs.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value.trim(),
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
                      controller: phoneNumberController,
                      decoration:
                          InputDecoration(hintText: provider.phoneNumber),
                    )),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RaisedButton(
                      onPressed: () async {
                        await provider.updateRecipientDetails(
                            usernameController.text,
                            emailController.text,
                            phoneNumberController.text,
                            _firstCountryPrefix);
                        Navigator.pop(context);
                      },
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
