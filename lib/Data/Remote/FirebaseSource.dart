import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/Data/Model/CountryPrefixCode.dart';
import 'package:grocery_app/Data/Model/ElementFV.dart';

class FirebaseSource {
  static FirebaseSource _firebaseSource;

  static FirebaseSource getInstance() {
    if (_firebaseSource == null) {
      _firebaseSource = FirebaseSource();
      return _firebaseSource;
    } else {
      return _firebaseSource;
    }
  }

  // Firebase instances
  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  // User Data
  bool userDataIsLoaded = false;
  String profileImageUrl;
  String username;
  String email;
  String phoneNumber;
  String numberPrefix;
  String userId = "";

  // Error massages
  String signInErrorMessage = "";
  String signOutErrorMessage = "";

  var savedCarts;
  List<String> prefixCodes = [];
  List<ElementFV> vegetables = [];
  List<ElementFV> fruits = [];
  List<ElementFV> cartElements = [];
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
      this.vegetables.add(ElementFV.fromJson(document.data));
    });

    this.fruits = [];
    fruit.documents.forEach((document) async {
      this.fruits.add(ElementFV.fromJson(document.data));
    });
  }

  Future<void> increaseAmount(ElementFV cart) async {
    var ref = _db.collection("Cart").document(cart.name);
    await ref.updateData({'amountForBuying': cart.amountForBuying + 1});
    cartElements.forEach((e) {
      if (e.name == cart.name) {
        e.incrementAmountForBuying();
        totalPrice += double.parse(cart.price);
      }
    });
    totalPrice = double.parse(totalPrice.toStringAsFixed(2));
  }

  Future<void> decreaseAmount(ElementFV cart) async {
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
        this.cartElements.add(ElementFV.fromJson(document.data));
    });
  }

  Future addElementToCart(ElementFV element) async {
    if (isExisted(cartElements, element) == false) {
      cartElements.add(element);
      totalPrice += double.parse(element.price);
      await _db
          .collection("Cart")
          .document(element.name)
          .setData(element.toMap(element));
    }

    totalPrice = double.parse(totalPrice.toStringAsFixed(2));
  }

  Future<void> deleteElementFromCart(ElementFV element) async {
    double elementPrice = double.parse(element.price);
    bool isRemoved = cartElements.remove(element);

    if (isRemoved == true) {
      totalPrice = totalPrice - elementPrice * element.amountForBuying;
      await _db.collection("Cart").document(element.name).delete();
    }
    totalPrice = double.parse(totalPrice.toStringAsFixed(2));
  }

  Future<void> romeveElementFromCart(ElementFV element) async {
    cartElements.remove(element);
    await _db.collection("Cart").document(element.name).delete();
  }

  bool isExisted(List<ElementFV> data, ElementFV e) {
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
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(() async {
        await getUserId();
        await _db
            .collection("Users")
            .document(userId)
            .setData({'username': username, 'email': email, 'id': userId});
      });
    } on PlatformException catch (e) {
      signOutErrorMessage = e.message;
      print(e.message.toString());
    }
  }

  Future addPhoneNumber(String phoneNumber, String numberPrefix) async {
    await _db
        .collection("Users")
        .document(userId)
        .updateData({"phoneNumber": phoneNumber, "numberPrefix": numberPrefix});
  }

  Future verifyPhoneNumber(String phoneNumber) async {
    return await _auth.verifyPhoneNumber(
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

  Future uploadProfileImageToStorage(File image) async {
    try {
      StorageReference firebaseStorageRef =
          _storage.ref().child('profileImages/$userId');
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      taskSnapshot.ref.getDownloadURL().then((value) async => await _db
          .collection("Users")
          .document(userId)
          .updateData({"profileImageUrl": value}));
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  Future<void> getProfileDetails() async {
    final docs = await _db.collection("Users").getDocuments().then((value) {
      for (int i = 0; i < value.documents.length; i++) {
        if (value.documents[i].data["id"].toString().trim() == userId) {
          email = value.documents[i].data["email"];
          username = value.documents[i].data["username"];
          phoneNumber = value.documents[i].data["phoneNumber"];
          numberPrefix = value.documents[i].data["numberPrefix"];
          profileImageUrl = value.documents[i].data["profileImageUrl"];
        } else {
          print("some error occured");
        }
      }
    });
    userDataIsLoaded = true;
  }

  Future<void> getContriesPrefixCode() async {
    List<CountryPrefixCode> countriesPrefixCode = [];
    final codes = await _db.collection("Countries prefix code").getDocuments();
    codes.documents.forEach((document) {
      countriesPrefixCode.add(CountryPrefixCode.fromJson(document.data));
    });
    countriesPrefixCode.forEach((element) {
      if (!prefixCodes.contains(element.code)) prefixCodes.add(element.code);
    });
  }

  Future<void> updateRecipientDetails(String uname, String emailAddress,
      String phone, String phonePrefix) async {
    if (uname.isEmpty) uname = username;
    if (emailAddress.isEmpty) emailAddress = email;
    if (phone.isEmpty) phone = phoneNumber;
    if (phonePrefix.isEmpty) phonePrefix = numberPrefix;

    try {
      await _db.collection("Users").document(userId).updateData({
        "email": emailAddress,
        "username": uname,
        "numberPrefix": phonePrefix,
        "phoneNumber": phone
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> saveCart(String cartName) async {
    cartElements.forEach((element) async {
      await _firebaseDatabase
          .reference()
          .child("Saved carts")
          .child(userId)
          .child(cartName)
          .child(element.name)
          .set(element.toMap(element));
    });
  }

  Future getUserId() async {
    FirebaseUser user = await _auth.currentUser();
    userId = user.uid;
  }

  getSavedCarts() {
    return _firebaseDatabase
        .reference()
        .child('Saved carts')
        .child(userId)
        .limitToFirst(10);
  }

  Future deleteSavedCart(String cartName) async {
    await _firebaseDatabase
        .reference()
        .child('Saved carts')
        .child(userId)
        .child(cartName)
        .remove();
  }

  Future<void> increaseAmountForBuyingForSavedCart(
      String cartName, ElementFV e) async {
    await _firebaseDatabase
        .reference()
        .child('Saved carts')
        .child(userId)
        .child(cartName)
        .child(e.name)
        .update({"amountForBuying": e.amountForBuying + 1});
    e.incrementAmountForBuying();
  }

  Future<void> decreaseAmountForBuyingForSavedCart(
      String cartName, ElementFV e) async {
    if (e.amountForBuying > 1) {
      await _firebaseDatabase
          .reference()
          .child('Saved carts')
          .child(userId)
          .child(cartName)
          .child(e.name)
          .update({
        "amountForBuying":
            (e.amountForBuying > 0) ? e.amountForBuying - 1 : () {}
      });
      e.decrementAmountForBuying();
    }
  }

  Future saveCreditCard(
      String name, String number, String month, String year, String cvv) async {
    await _firebaseDatabase
        .reference()
        .child("Credit cards")
        .child(userId)
        .child(number)
        .set({
      "holderName": name,
      "number": number,
      "month": month,
      "year": year,
      "cvv": cvv
    });
  }

  getCreditCards() {
    return _firebaseDatabase
        .reference()
        .child("Credit cards")
        .child(userId)
        .limitToFirst(10);
  }

  Future deleteCreditCard(String cardNumber) async {
    await _firebaseDatabase
        .reference()
        .child("Credit cards")
        .child(userId)
        .child(cardNumber)
        .remove();
  }
}
