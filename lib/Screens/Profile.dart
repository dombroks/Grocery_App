import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: size.height * 0.15,
          color: Colors.amber,
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
                    Text("tinoutech@gmail.com"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("0777 000 000"),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
