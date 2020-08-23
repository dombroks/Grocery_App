import 'package:flutter/material.dart';
import 'package:grocery_app/components/ProfileCardItem.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.grey[300],
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: size.height * 0.15,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://th.bing.com/th/id/OIP.ju1vmgfjRSJnPU4fcOCyJwHaE8?pid=Api&w=1200&h=800&rs=1"),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Jessica alison",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "tinoutech@gmail.com",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "0777 000 000",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  children: [
                    ProfileCardItem(
                      itemName: "Recipient details",
                      colordata: Colors.purple,
                      icon: Icons.account_circle,
                    ),
                    ProfileCardItem(
                      itemName: "Delivery address",
                      colordata: Colors.yellow,
                      icon: Icons.local_shipping,
                    ),
                    ProfileCardItem(
                      itemName: "Payment Method",
                      colordata: Colors.orange,
                      icon: Icons.monetization_on,
                    ),
                    ProfileCardItem(
                      itemName: "Change password",
                      colordata: Colors.pink[300],
                      icon: Icons.lock,
                    ),
                    ProfileCardItem(
                      itemName: "Logout",
                      colordata: Colors.red[700],
                      icon: Icons.exit_to_app,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}