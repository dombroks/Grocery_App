import 'package:flutter/material.dart';

class ProfileCardItem extends StatelessWidget {
  final String itemName;
  final Function toAnotherScreen;

  const ProfileCardItem({
    Key key,
    this.itemName,
    this.toAnotherScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                itemName,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 13,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
