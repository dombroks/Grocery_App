import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/AddPaymentMethod.dart';
import 'package:grocery_app/Viewmodel/SharedViewModel.dart';
import 'package:grocery_app/constants.dart';
import 'package:provider/provider.dart';

class AddCardScreen extends StatefulWidget {
  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController cvv = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    number.dispose();
    month.dispose();
    year.dispose();
    cvv.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SharedViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(
            Icons.close,
            color: Colors.grey,
          ),
          onTap: () {
            Navigator.pop(context);
          },
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
                controller: name,
                decoration: InputDecoration(hintText: "Card holder name"),
              ),
              TextField(
                controller: number,
                decoration: InputDecoration(hintText: "Card number"),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: month,
                        decoration: InputDecoration(hintText: "Month"),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        controller: year,
                        decoration: InputDecoration(hintText: "Year"),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        controller: cvv,
                        decoration: InputDecoration(hintText: "CVV number"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    onPressed: () async {
                      await provider.saveCreditCard(name.text, number.text,
                          month.text, year.text, cvv.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddPaymentMethod()));
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
    );
  }
}
