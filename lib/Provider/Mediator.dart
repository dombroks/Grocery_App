import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app/Model/element.dart';

class Mediator extends ChangeNotifier {
  final Firestore _db = Firestore.instance;

  List<element> vegetables = [];
  List<element> fruits = [];
  List<element> cartElements = [];
  double totalPrice = 0.0;

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

  Future<void> increaseOrDecreaseAmount(element cart, String operation) async {
    if (operation == "increase") {
      await _db
          .collection("Cart")
          .document(cart.name)
          .updateData({'amountForBuying': int.parse(cart.amountForBuying) + 1});
      print("increased");
    } else {
      await _db.collection("Cart").document(cart.name).updateData(
          {'amountForBuying': "${double.parse(cart.amountForBuying) - 1}"});
      print("decreased");
    }
  }

  getCartElementsTotalPrice() {
    cartElements.forEach((element) {
      totalPrice += double.parse(element.price);
    });
    totalPriceIsLoaded = true;
    print(totalPrice);
  }

  fetchCartElements() async {
    final cart = await _db.collection("Cart").getDocuments();
    this.cartElements = [];
    cart.documents.forEach((document) async {
      if (!cartElements.contains(document.data))
        this.cartElements.add(element.fromJson(document.data));
    });
  }

  Future addElementToCart(element element) async {
    if (!cartElements.contains(element)) {
      cartElements.add(element);
      totalPrice += double.parse(element.price);
    }

    await _db
        .collection("Cart")
        .document(element.name)
        .setData(element.toMap(element));
  }
}
