import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/PaymentMethod.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import 'DeliveryType.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  DateTime _selectedDate;
  String _formattedDate;
  TextEditingController _controller;
  List<String> _pickUpPoints;
  List<String> _homeDeliveryCities;
  List<String> _homeDeliverySubCities;
  String _firstValuePickUp;
  String _firstValueHomeDelivery;
  String _firstValueHomeDeliveryForSubCities;

  @override
  void initState() {
    _firstValuePickUp = "Khelil";
    _firstValueHomeDelivery = "Bordj Bou Arreridj";
    _firstValueHomeDeliveryForSubCities = "Sidi Embarek";
    _pickUpPoints = ["Khelil", "Ras El Ain", "Cheffa"];
    _homeDeliveryCities = ["Bordj Bou Arreridj", "Batna", "Setif", "Guelma"];
    _homeDeliverySubCities = ["Khelil", "Sidi Embarek", "Barika"];
    _selectedDate = DateTime.now();
    _formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
    _controller = TextEditingController();
    _controller.text = _formattedDate;
    super.initState();
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
        _controller.text = _formattedDate;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 280,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.cancel,
                      size: 30,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Select Delivery Type",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: DeliveryType(
                mainTitle: "Home Delivery",
                secondTitle: "Within delivery grid",
                icon: Icons.home,
                colorData: Colors.orange[300],
              ),
              onTap: () {
                showHomeDeliveryDialog();
              },
            ),
            GestureDetector(
              child: DeliveryType(
                mainTitle: "Pick Up",
                secondTitle: "Only from our outlets",
                icon: Icons.shopping_basket,
                colorData: Colors.orange[900],
              ),
              onTap: () {
                showPickUpDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  //---------------------------------------------
  Future showHomeDeliveryDialog() {
    return showDialog(
      context: context,
      builder: (_) => Dialog(
        child: Container(
          height: 420,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Home delivery",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange[300],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select delivery area",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Delivery charges apply",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: DropdownButton(
                          isExpanded: true,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.deepOrange,
                          ),
                          value: _firstValueHomeDelivery,
                          items: _homeDeliveryCities.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _firstValueHomeDelivery = newValue;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: DropdownButton(
                          isExpanded: true,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.deepOrange,
                          ),
                          value: _firstValueHomeDeliveryForSubCities,
                          items: _homeDeliverySubCities.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _firstValueHomeDeliveryForSubCities = newValue;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "SAVE",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            RaisedButton(
                              color: kPrimaryColor,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PaymentMethod()));
                              },
                              child: Text(
                                "NEXT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //---------------------------------

  Future showPickUpDialog() {
    return showDialog(
      context: context,
      builder: (_) => Dialog(
        child: Container(
          height: 370,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Pick up",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.directions_walk,
                        color: Colors.white,
                      ),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pick up from outlet",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Only from our outlets",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: DropdownButton(
                          isExpanded: true,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.deepOrange,
                          ),
                          value: _firstValuePickUp,
                          items: _pickUpPoints.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _firstValuePickUp = newValue;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _controller,
                          readOnly: true,
                          onTap: () {
                            _selectDate(context);
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "SAVE",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            RaisedButton(
                              color: kPrimaryColor,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PaymentMethod()));
                              },
                              child: Text(
                                "NEXT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
