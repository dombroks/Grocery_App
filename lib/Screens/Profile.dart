import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/Screens/AddPaymentMethod.dart';
import 'package:grocery_app/Screens/AuthScreen.dart';
import 'package:grocery_app/Screens/ChangePasswordScreen.dart';
import 'package:grocery_app/Screens/RecipientDetails.dart';
import 'package:grocery_app/components/ProfileCardItem.dart';
import 'package:grocery_app/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final picker = ImagePicker();
  File _image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: size.height * 0.15,
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: kPrimaryColor,
                          )),
                      width: 90,
                      height: 90,
                      child: _image == null
                          ? Icon(
                              Icons.camera,
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
                    onTap: () {
                      getImage();
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Jessica alison",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "tinoutech@gmail.com",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "0777 000 000",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: ProfileCardItem(
                          itemName: "Recipient details",
                          colordata: Colors.purple,
                          icon: Icons.account_circle,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecipientDatails()));
                        },
                      ),
                      SizedBox(
                        height: 0.5,
                      ),
                      GestureDetector(
                        child: ProfileCardItem(
                          itemName: "Delivery address",
                          colordata: Colors.blue,
                          icon: Icons.local_shipping,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecipientDatails()));
                        },
                      ),
                      SizedBox(
                        height: 0.5,
                      ),
                      GestureDetector(
                        child: ProfileCardItem(
                          itemName: "Payment Method",
                          colordata: Colors.green,
                          icon: Icons.monetization_on,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddPaymentMethod()));
                        },
                      ),
                      SizedBox(
                        height: 0.5,
                      ),
                      GestureDetector(
                        child: ProfileCardItem(
                          itemName: "Change password",
                          colordata: Colors.pink[300],
                          icon: Icons.lock,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChangePasswordScreen()));
                        },
                      ),
                      SizedBox(
                        height: 0.5,
                      ),
                      GestureDetector(
                        child: ProfileCardItem(
                          itemName: "Logout",
                          colordata: Colors.red[700],
                          icon: Icons.exit_to_app,
                        ),
                        onTap: () {
                          _showAlertDialg();
                        },
                      ),
                    ],
                  ),
                ))
          ],
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

  _showAlertDialg() {
    showDialog(
      context: context,
      builder: (context) {
        final provider = Provider.of<Mediator>(context, listen: false);
        return AlertDialog(
          title: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          ),
          content: Text(
            "  Are you sure you want to logout?",
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'No',
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              color: Colors.red,
              child: Text('LOGOUT'),
              onPressed: () async {
                provider.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen("In")),
                  ModalRoute.withName('/'),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
