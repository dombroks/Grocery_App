import 'package:flutter/material.dart';
import 'package:grocery_app/components/MyButton.dart';
import 'package:grocery_app/constants.dart';

class AddNumber extends StatefulWidget {
  @override
  _AddNumberState createState() => _AddNumberState();
}

class _AddNumberState extends State<AddNumber> {
  String _firstCountryPrefix = "+213";

  List<String> _countriesPrefixs = ["+213", "+01", "+43"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Add number"),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "What's your number",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Enter mobile number to continue",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20,
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
                  height: 20,
                ),
                Row(
                  children: [MyButton("SEND", () {})],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
