import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/Data/Model/CountryPrefixCode.dart';
import 'package:grocery_app/Data/Model/ElementFV.dart';
import 'package:grocery_app/Data/Remote/Repository/AuthRepository.dart';
import 'package:grocery_app/Data/Remote/Repository/CartRepository.dart';


class SharedViewModel extends ChangeNotifier {
  AuthRepository _auth = AuthRepository.getInstance();
  CartRepository _cart = CartRepository.getInstance();

  final Firestore _db = Firestore.instance;
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
    await _cart.increaseAmount(cart);
    notifyListeners();
  }

  Future<void> decreaseAmount(ElementFV cart) async {
    _cart.decreaseAmount(cart);
    notifyListeners();
  }

  getCartElementsTotalPrice() {
    _cart.getCartElementsTotalPrice();
  }

  fetchCartElements() async {
    await _cart.fetchCartElements();
    notifyListeners();
  }

  Future addElementToCart(ElementFV element) async {
    await _cart.addElementToCart(element);
    notifyListeners();
  }

  Future<void> deleteElementFromCart(ElementFV element) async {
    await _cart.deleteElementFromCart(element);
    notifyListeners();
  }

  Future<void> romeveElementFromCart(ElementFV element) async {
    await _cart.romeveElementFromCart(element);
    notifyListeners();
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
    await _auth.signInWithEmailAndPassword(email, password);
  }

  Future<bool> isLoggedIn() async {
    return await _auth.isLoggedIn();
  }

  Future signOut() async {
    await _auth.signOut();
  }

  Future signUpWithEmailAndPassword(
      String username, String email, String password) async {
    await _auth.signInWithEmailAndPassword(email, password);
  }

  Future addPhoneNumber(String phoneNumber, String numberPrefix) async {
    await _auth.addPhoneNumber(phoneNumber, numberPrefix);
  }

  Future verifyPhoneNumber(String phoneNumber) async {
    return await _auth.verifyPhoneNumber(phoneNumber);
  }

  Future<void> resetPasswordWithEmail(String email) async {
    await _auth.resetPasswordWithEmail(email);
  }

  Future uploadProfileImageToStorage(File image) async {
    await _auth.uploadProfileImageToStorage(image);
    notifyListeners();
  }

  Future<void> getProfileDetails() async {
    await _auth.getProfileDetails();
    notifyListeners();
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
    await _cart.saveCart(cartName);
  }

  Future getUserId() async {
    await _auth.getUserId().then((value) => userId = value.uid);
  }

  getSavedCarts() {
    _cart.getSavedCarts();
  }

  Future deleteSavedCart(String cartName) async {
    await _cart.deleteSavedCart(cartName);
    notifyListeners();
  }

  Future<void> increaseAmountForBuyingForSavedCart(
      String cartName, ElementFV e) async {
    await _cart.increaseAmountForBuyingForSavedCart(cartName, e);
    notifyListeners();
  }

  Future<void> decreaseAmountForBuyingForSavedCart(
      String cartName, ElementFV e) async {
    await _cart.decreaseAmountForBuyingForSavedCart(cartName, e);
    notifyListeners();
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
    notifyListeners();
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
    notifyListeners();
  }
}
