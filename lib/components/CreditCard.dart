import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dom Broks",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.delete_outline,
                color: Colors.grey,
              )
            ],
          ),
        ],
      ),
    );
  }
}
