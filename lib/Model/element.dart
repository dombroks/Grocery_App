
class element {
  final String name;
  final String price;
  final String image;
  final String amount;
  final int amountForBuying ;

  element(
    this.name,
    this.price,
    this.image,
    this.amount, 
    this.amountForBuying ,
  );

  element.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        image = parsedJson['image'],
        amount = parsedJson['amount'],
        price = parsedJson['price'] ,
        amountForBuying = parsedJson['amountForBuying'];

  //For uploading as cart element
  Map<String, dynamic> toMap(element element) {
    return {
      'name': element.name,
      'image': element.image,
      'amount': element.amount,
      'price': element.price,
      'totalPrice': element.price,
      'amountForBuying': 1
    };
  }
}
