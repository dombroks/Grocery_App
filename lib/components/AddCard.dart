import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/AddCardScreen.dart';

class AddCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                height: 190,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 31,
                        color: Colors.grey,
                      ),
                      Text(
                        "Add a card",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddCardScreen()));
      },
    );
  }
}
