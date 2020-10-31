import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/Model/element.dart';

class Mediator extends ChangeNotifier {
  // Firebase instances
  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Error massages
  String signInErrorMessage = "";
  String signOutErrorMessage = "";

  List<element> vegetables = [];
  List<element> fruits = [];
  List<element> cartElements = [];
  double totalPrice = 0.00;

  bool totalPriceIsLoaded = false;

  Future<void> fetchData() async {
    final vegetable = await _db
        .collection("Vegetable")
        .where("type", isEqualTo: "vegetable")
        .getDocuments();

    final fruit = await _db
        .collection("Vegetable")
        .where("type", isEqualTo: "fruit")
        .getDocuments();

    this.vegetables = [];
    vegetable.documents.forEach((document) async {
      this.vegetables.add(element.fromJson(document.data));
    });

    this.fruits = [];
    fruit.documents.forEach((document) async {
      this.fruits.add(element.fromJson(document.data));
    });
  }

  Future<void> increaseAmount(element cart) async {
    var ref = _db.collection("Cart").document(cart.name);
    await ref.updateData({'amountForBuying': cart.amountForBuying + 1});
    cartElements.forEach((e) {
      if (e.name == cart.name) {
        e.incrementAmountForBuying();
        totalPrice += double.parse(cart.price);
      }
    });
    totalPrice = double.parse(totalPrice.toStringAsFixed(2));
    notifyListeners();
  }

  Future<void> decreaseAmount(element cart) async {
    if (cart.amountForBuying == 1) return;
    await _db
        .collection("Cart")
        .document(cart.name)
        .updateData({'amountForBuying': (cart.amountForBuying).toInt() - 1});
    cartElements.forEach((e) {
      if (e.name == cart.name) {
        if (e.amountForBuying > 1) {
          e.decrementAmountForBuying();
          if (totalPrice > double.parse(cart.price)) {
            totalPrice -= double.parse(cart.price);
            print(e.amountForBuying);
            print("decreased");
          }
        }
      }
    });
    totalPrice = double.parse(totalPrice.toStringAsFixed(2));
    notifyListeners();
  }

  getCartElementsTotalPrice() {
    cartElements.forEach((element) {
      totalPrice += double.parse(element.price);
    });
    totalPriceIsLoaded = true;
  }

  fetchCartElements() async {
    final cart = await _db.collection("Cart").getDocuments();
    this.cartElements = [];
    cart.documents.forEach((document) async {
      if (!cartElements.contains(document.data))
        this.cartElements.add(element.fromJson(document.data));
    });
    notifyListeners();
  }

  Future addElementToCart(element element) async {
    if (isExisted(cartElements, element) == false) {
      cartElements.add(element);
      totalPrice += double.parse(element.price);
      await _db
          .collection("Cart")
          .document(element.name)
          .setData(element.toMap(element));
    }

    totalPrice = double.parse(totalPrice.toStringAsFixed(2));
    notifyListeners();
  }

  Future<void> deleteElementFromCart(element element) async {
    double elementPrice = double.parse(element.price);
    bool isRemoved = cartElements.remove(element);

    if (isRemoved == true) {
      totalPrice = totalPrice - elementPrice * element.amountForBuying;
      await _db.collection("Cart").document(element.name).delete();
    }
    totalPrice = double.parse(totalPrice.toStringAsFixed(2));
    notifyListeners();
  }

  Future<void> romeveElementFromCart(element element) async {
    cartElements.remove(element);
    await _db.collection("Cart").document(element.name).delete();
    notifyListeners();
  }

  bool isExisted(List<element> data, element e) {
    bool isExisted = false;
    data.forEach((a) {
      if (a.name == e.name) {
        isExisted = true;
      }
    });
    return isExisted;
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on PlatformException catch (e) {
      signInErrorMessage = e.message;
      print(e.message);
    }
  }

  Future<bool> isLoggedIn() async {
    FirebaseUser user = await _auth.currentUser();
    return user.uid == null;
  }

  Future signOut() async {
    await _auth.signOut();

    signInErrorMessage = "";
    signOutErrorMessage = "";
  }

  Future signUpWithEmailAndPassword(
      String username, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await _db.collection("Users").document(user.uid).setData({
        'username': username,
        'email': email,
      });
    } on PlatformException catch (e) {
      signOutErrorMessage = e.message;
    }
  }

  Future addPhoneNumber(String phoneNumber) async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;

    await _db
        .collection("Users")
        .document(uid)
        .updateData({"phoneNumber": phoneNumber});
  }

  Future verifyPhoneNumber(String phoneNumber) async {
    _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: null,
        verificationFailed: (AuthException exception) {
          print(exception.message);
        },
        codeSent: null,
        codeAutoRetrievalTimeout: null);
  }

  Future<void> resetPasswordWithEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future uploadFile(File image) async {
    FirebaseUser user = await _auth.currentUser();
    try {
      StorageReference firebaseStorageRef =
          _storage.ref().child('uploads/image');
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      taskSnapshot.ref.getDownloadURL().then(
            (value) => print("Done: $value"),
          );
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
