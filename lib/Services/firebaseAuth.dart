
import 'package:firebase_auth/firebase_auth.dart';

class firebaseAuth{
  FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign in with credentials
  Future signInWithEmailAndPassword(String email, String password) async {
    dynamic result;
    try {
      result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      e.toString();
    }
    return result.user;
  }

  //Sign in with google

  //Sign Out

  //User state : logged or not
  Future get user async {
    var result = await _auth.currentUser();
    return result;
  }
}