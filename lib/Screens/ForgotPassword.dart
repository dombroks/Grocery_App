import 'package:flutter/material.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/components/MyButton.dart';
import 'package:grocery_app/constants.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Mediator>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Forgot password"),
      ),
      body: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            width: double.infinity,
            height: 190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Password reset",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Enter email address to send reset code",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(hintText: "Email address"),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyButton("SEND", () async {
                      await provider
                          .resetPasswordWithEmail(_emailController.text);
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
