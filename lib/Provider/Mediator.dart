import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app/Model/element.dart';
import 'package:grocery_app/Services/firebaseFirestore.dart';

class Mediator extends ChangeNotifier {
  final Firestore _db = Firestore.instance;

  List<element> vegetables = [];
  List<element> fruits = [];

  Future<void> fetchFruits() async {
    final documents = await _db.collection("Vegetable").where("type",isEqualTo: "vegetable").getDocuments();
    
 final documents2 = await _db.collection("Vegetable").where("type",isEqualTo: "fruit").getDocuments();


    this.vegetables = [];
    documents.documents.forEach((document) async {
      this.vegetables.add(element.fromJson(document.data));
    });

     this.fruits = [];
    documents2.documents.forEach((document) async {
      this.fruits.add(element.fromJson(document.data));
    });
  }

  final firebaseFirestore _firestore = firebaseFirestore();
  Stream<List<element>> getElements(String collection) {
    return _firestore.getElements(collection);
  }

  Stream<QuerySnapshot> getData(String collection) {
    return _firestore.getData(collection);
  }
}
