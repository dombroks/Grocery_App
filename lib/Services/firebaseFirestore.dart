import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/Model/Fruit.dart';
import 'package:grocery_app/Model/Vegetable.dart';

class firebaseFirestore {
  final _firestore = Firestore.instance;

  Stream<List<Fruit>> getFruits() {
    return _firestore.collection("Fruit").snapshots().map((snapshot) => snapshot
        .documents
        .map((document) => Fruit.fromJson(document.data))
        .toList());
  }

  Stream<List<Vegetable>> getVegetables() {
    return _firestore.collection("Vegetable").snapshots().map((snapshot) =>
        snapshot.documents
            .map((document) => Vegetable.fromJson(document.data))
            .toList());
  }

  void addElementToCart(Fruit fruit) {
    _firestore
        .collection("Cart")
        .document(fruit.name)
        .setData(fruit.toMap(fruit));
  }

  void romeveElementFromCart(Fruit fruit) {
    _firestore.collection("Cart").document(fruit.name).delete();
  }
}
