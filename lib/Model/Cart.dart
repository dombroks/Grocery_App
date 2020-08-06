import 'dart:collection';

class Cart {
  final String name;
  final String price;
  final String image;
  final String amount;

  Cart(
    this.name,
    this.price,
    this.image,
    this.amount,
  );

  Cart.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        image = parsedJson['image'],
        amount = parsedJson['amount'],
        price = parsedJson['price'];

  Map<String, dynamic> toMap(Cart cart) {
    return {
      'name': cart.name,
      'image': cart.image,
      'amount': cart.amount,
      'price': cart.price,
      'totalPrice': cart.price,
      'amountForBuying': cart.amount
    };
  }
}
