import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app/Model/Cart.dart';
import 'package:grocery_app/Model/element.dart';

class Mediator extends ChangeNotifier {
  final Firestore _db = Firestore.instance;

  List<element> vegetables = [];
  List<element> fruits = [];
  List<Cart> cartElements = [];

  bool isLoaded = false;

  Future<void> fetchData() async {
    final vegetable = await _db
        .collection("Vegetable")
        .where("type", isEqualTo: "vegetable")
        .getDocuments();

    final fruit = await _db
        .collection("Vegetable")
        .where("type", isEqualTo: "fruit")
        .getDocuments();

    final cart = await _db.collection("Cart").getDocuments();

    this.vegetables = [];
    vegetable.documents.forEach((document) async {
      this.vegetables.add(element.fromJson(document.data));
    });
    this.cartElements = [];
    cart.documents.forEach((document) async {
      this.cartElements.add(Cart.fromJson(document.data));
    });

    this.fruits = [];
    fruit.documents.forEach((document) async {
      this.fruits.add(element.fromJson(document.data));
    });

    isLoaded = true;
  }
}
