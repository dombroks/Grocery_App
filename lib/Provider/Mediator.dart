import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app/Model/element.dart';

class Mediator extends ChangeNotifier {
  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
    if (isExicted(cartElements, element) == false) {
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

  bool isExicted(List<element> data, element e) {
    bool isExicted = false;
    data.forEach((a) {
      if (a.name == e.name) {
        isExicted = true;
      }
    });
    return isExicted;
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
