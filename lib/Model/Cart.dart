import 'package:grocery_app/Model/element.dart';

class Cart {
  String cartName;
  List<element> elements;
  String totalPrice;
  Cart(List<element> elements, String cartName, String totalPrice) {
    this.elements = elements;
    this.totalPrice = totalPrice;
    this.cartName = cartName;
  }
  Map<String, dynamic> toMap(Cart cart) {
    return {
      'cartName': cart.cartName,
      'elements': {'data': "fdg"},
      'totalPrice': cart.totalPrice
    };
  }

  Cart.fromMap(Map<String, dynamic> parsedJson);
}
