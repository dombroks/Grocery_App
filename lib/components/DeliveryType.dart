import 'package:flutter/material.dart';

class DeliveryType extends StatelessWidget {
  final Color colorData;
  final String mainTitle;
  final String secondTitle;
  final IconData icon;
  final Function job;
  const DeliveryType({
    Key key,
    this.colorData,
    this.mainTitle,
    this.secondTitle,
    this.icon,
    this.job,
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
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorData,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainTitle,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    secondTitle,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            child: Icon(
              Icons.arrow_forward_ios,
              size: 13,
              color: Colors.grey,
            ),
            onTap: () {
              job();
            },
          ),
        ],
      ),
    );
  }
}
