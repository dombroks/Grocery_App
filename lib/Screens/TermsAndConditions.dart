import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';

class TermsConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: GestureDetector(
          child: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Terms & conditions"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Product Terms",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sed rhoncus mi. Nullam enim arcu, feugiat eget arcu a, sagittis pretium purus. Integer ac eros vel odio aliquet imperdiet at nec leo. Sed ac diam nisi. Phasellus tristique, libero sed porta consequat, nulla est accumsan libero, eget ultrices lectus elit ut lorem. Mauris vitae nulla non quam efficitur tempor et id metus."),
              SizedBox(
                height: 20,
              ),
              Text(
                "1. Use of the Site",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sed rhoncus mi. Nullam enim arcu, feugiat eget arcu a, sagittis pretium purus. Integer ac eros vel odio aliquet imperdiet at nec leo. Sed ac diam nisi. Phasellus tristique, libero sed porta consequat, nulla est accumsan libero, eget ultrices lectus elit ut lorem. Mauris vitae nulla non quam efficitur tempor et id metus."),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "THESR TERMS AND CONDITIONS DO NOT AFFECT YOUR STATUTORY RIGHTS.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "1. Amendments",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "We may revise the terms and conditions from time to time without notice to you Lorem ipsum dolor sit")
            ],
          ),
        ),
      ),
    );
  }
}
