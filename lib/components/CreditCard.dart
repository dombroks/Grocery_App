import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Text("Dom Broks"),
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
