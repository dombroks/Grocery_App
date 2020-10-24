import 'package:flutter/material.dart';

import '../constants.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: kPrimaryColor,
      onPressed: () {},
      child: Text(
        "  SAVE  ",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
