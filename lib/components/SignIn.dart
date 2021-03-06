import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/ForgotPassword.dart';
import 'package:grocery_app/Screens/Home.dart';
import 'package:grocery_app/Viewmodel/SharedViewModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MyButton.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _obscureText = true;
    super.initState();
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
              "Sign in to Grocery App",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Enter email & password to continue",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(hintText: "Email address"),
            ),
            TextField(
              obscureText: _obscureText,
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.remove_red_eye),
                    onTap: () {
                      _toggleShowPassword();
                    },
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                  },
                ),
                MyButton("SIGN IN", () async {
                  await provider.signInWithEmailAndPassword(
                      emailController.text.trim(), passwordController.text);
                  if (provider.signInErrorMessage.isNotEmpty) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(provider.signInErrorMessage),
                    ));
                  } else {
                    // Collapsing keyboard
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    // Saving data to shared preferences for session purpose
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('isLoggedIn', true);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home(0)),
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
