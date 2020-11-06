import 'package:flutter/material.dart';

import '../constants.dart';

class DrawerListTile extends StatelessWidget {
  final Function onClick;
  final IconData iconData;
  final String title;
  const DrawerListTile({
    Key key,
    this.onClick,
    this.iconData,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: kCategoryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              iconData,
              color: kPrimaryColor,
              size: 28,
            ),
          ),
        ),
      ),
      onTap: () {
        onClick();
      },
    );
  }
}
