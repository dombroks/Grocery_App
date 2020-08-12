import 'dart:collection';

class element {
  final String name;
  final String price;
  final String image;
  final String amount;

  element(
    this.name,
    this.price,
    this.image,
    this.amount,
  );

  element.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        image = parsedJson['image'],
        amount = parsedJson['amount'],
        price = parsedJson['price'];

  //For uploading as cart element
  Map<String, dynamic> toMap(element element) {
    return {
      'name': element.name,
      'image': element.image,
      'amount': element.amount.replaceAll("Kg", ""),
      'price': element.price,
      'totalPrice': element.price,
      'amountForBuying': element.amount.replaceAll("Kg", "")
    };
  }
}
