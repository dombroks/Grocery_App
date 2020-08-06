import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/Model/Cart.dart';
import 'package:grocery_app/Model/Fruit.dart';
import 'package:grocery_app/Model/Vegetable.dart';

class firebaseFirestore {
  final _firestore = Firestore.instance;

  Stream<List<Fruit>> getFruits(String collection) {
    return _firestore.collection(collection).snapshots().map((snapshot) =>
        snapshot.documents
            .map((document) => Fruit.fromJson(document.data))
            .toList());
  }

  Stream<List<Vegetable>> getVegetables(String collection) {
    return _firestore.collection(collection).snapshots().map((snapshot) =>
        snapshot.documents
            .map((document) => Vegetable.fromJson(document.data))
            .toList());
  }

  Stream<List<Cart>> getCartElements() {
    return _firestore.collection("Cart").snapshots().map((snapshot) => snapshot
        .documents
        .map((document) => Cart.fromJson(document.data))
        .toList());
  }

  void addFruitToCart(Fruit fruit) {
    _firestore
        .collection("Cart")
        .document(fruit.name)
        .setData(fruit.toMap(fruit));
  }

  void romeveFruitFromCart(Fruit fruit) {
    _firestore.collection("Cart").document(fruit.name).delete();
  }

  void addVegetableToCart(Vegetable vegetable) {
    _firestore
        .collection("Cart")
        .document(vegetable.name)
        .setData(vegetable.toMap(vegetable));
  }

  void romeveVegetableFromCart(Vegetable vegetable) {
    _firestore.collection("Cart").document(vegetable.name).delete();
  }

  void increaseOrDecreaseAmount(String operation, Cart cart) {
    if (operation == "increase") {
      _firestore.collection("Cart").document(cart.name).updateData({
        'name': cart.name,
        'image': cart.image,
        'amount': cart.amount,
        'price': cart.price,
        'totalPrice': cart.price,
        'amountForBuying': double.parse(cart.amount) + 1
      });
    } else {
      _firestore.collection("Cart").document(cart.name).updateData({
        'name': cart.name,
        'image': cart.image,
        'amount': cart.amount,
        'price': cart.price,
        'totalPrice': cart.price,
        'amountForBuying': "${double.parse(cart.amount) - 1}"
      });
    }
  }
}
