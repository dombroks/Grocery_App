import 'package:flutter/material.dart';

class ProfileCardItem extends StatelessWidget {
  final String itemName;
  final Function toAnotherScreen;
  final Color colordata;
  final IconData icon;

  const ProfileCardItem({
    Key key,
    this.itemName,
    this.toAnotherScreen,
    this.colordata,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colordata,
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
