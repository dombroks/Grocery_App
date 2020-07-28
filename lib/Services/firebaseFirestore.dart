import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/Model/Product.dart';

class firebaseFirestore {
  final _firestore = Firestore.instance;

  Stream<List<Product>> getProducts() {
    return  _firestore.collection("Fruit").snapshots().map((snapshot) => snapshot
        .documents
        .map((document) => Product.fromJson(document.data))
        .toList());
  }
}
