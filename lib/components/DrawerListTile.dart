import 'package:flutter/material.dart';

import '../constants.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Order history",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: kCategoryColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.history,
          color: kPrimaryColor,
          size: 30,
        ),
      ),
    );
  }
}
