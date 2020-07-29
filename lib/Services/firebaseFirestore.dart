import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/Model/FruitOrVegetable.dart';
import 'package:grocery_app/components/vegetaleAndFruit.dart';

class firebaseFirestore {
  final _firestore = Firestore.instance;

  Stream<List<FruitOrVegetable>> getProducts() {
    return  _firestore.collection("Fruit").snapshots().map((snapshot) => snapshot
        .documents
        .map((document) => FruitOrVegetable.fromJson(document.data))
        .toList());
  }
}
