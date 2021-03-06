import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/AddNumber.dart';
import 'package:grocery_app/Viewmodel/SharedViewModel.dart';
import 'package:provider/provider.dart';

import 'MyButton.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText;

  @override
  void initState() {
    _obscureText = true;
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SharedViewModel>(context, listen: false);
    void _toggleShowPassword() {
      setState(() {
        _obscureText = !_obscureText;
        print(_obscureText);
      });
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcom to Grocery App",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Let's get started",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(hintText: "Username"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email address"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.remove_red_eye),
                    onTap: () {
                      _toggleShowPassword();
                    },
                  )),
              obscureText: _obscureText,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton("NEXT", () async {
                  await provider.signUpWithEmailAndPassword(
                      usernameController.text,
                      emailController.text,
                      passwordController.text);
                  if (provider.signOutErrorMessage.isNotEmpty) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(provider.signOutErrorMessage),
                    ));
                  } else {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => AddNumber()),
                      ModalRoute.withName('/'),
                    );
                  }
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
