import 'package:flutter/material.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/Screens/SavedCarts.dart';
import 'package:grocery_app/components/MyButton.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class SaveCart extends StatefulWidget {
  @override
  _SaveCartState createState() => _SaveCartState();
}

class _SaveCartState extends State<SaveCart> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Mediator>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Save cart"),
      ),
      body: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Container(
            width: double.infinity,
            height: 208,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: Colors.white,
                      ),
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kPrimaryColor),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Save shopping cart",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "When you're ready, you can check out",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: "Enter cart name"),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyButton("NEXT", () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SavedCarts()));
                    })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
