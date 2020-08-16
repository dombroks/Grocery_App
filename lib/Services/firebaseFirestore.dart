import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/Model/Cart.dart';
import 'package:grocery_app/Model/element.dart';

class firebaseFirestore {
  final _firestore = Firestore.instance;

  Stream<List<element>> getElements(String collection) {
    return _firestore.collection(collection).snapshots().map((snapshot) =>
        snapshot.documents
            .map((document) => element.fromJson(document.data))
            .toList());
  }

  Stream<List<Cart>> getCartElements() {
    return _firestore.collection("Cart").snapshots().map((snapshot) => snapshot
        .documents
        .map((document) => Cart.fromJson(document.data))
        .toList());
  }

  Future addElementToCart(element element) async {
    await _firestore
        .collection("Cart")
        .document(element.name)
        .setData(element.toMap(element));
  }

  Future romeveElementFromCart(element element) async {
    await _firestore.collection("Cart").document(element.name).delete();
  }

  Future increaseOrDecreaseAmount(String operation, Cart cart) async {
    if (operation == "increase") {
      await _firestore.collection("Cart").document(cart.name).updateData({
        'name': cart.name,
        'image': cart.image,
        'amount': cart.amount,
        'price': cart.price,
        'totalPrice': cart.price,
        'amountForBuying': double.parse(cart.amount) + 1
      });
    } else {
      await _firestore.collection("Cart").document(cart.name).updateData({
        'name': cart.name,
        'image': cart.image,
        'amount': cart.amount,
        'price': cart.price,
        'totalPrice': cart.price,
        'amountForBuying': "${double.parse(cart.amount) - 1}"
      });
    }
  }

  Stream<QuerySnapshot> getData(String type) {
    return _firestore.collection("Vegetable").snapshots();
  }
}
