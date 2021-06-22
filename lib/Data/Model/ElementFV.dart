class ElementFV {
  String name;
  String price;
  String image;
  String amount = '1';
  int amountForBuying = 1;

  ElementFV(
    this.name,
    this.price,
    this.image,
    this.amount,
    this.amountForBuying,
  );

  ElementFV.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        image = parsedJson['image'],
        amount = parsedJson['amount'],
        price = parsedJson['price'],
        amountForBuying = parsedJson['amountForBuying'];

  //For uploading as cart element
  Map<String, dynamic> toMap(ElementFV element) {
    return {
      'name': element.name,
      'image': element.image,
      'amount': element.amount,
      'price': element.price,
      'totalPrice': element.price,
      'amountForBuying': element.amountForBuying,
    };
  }

  void incrementAmountForBuying() {
    this.amountForBuying += 1;
  }

  void decrementAmountForBuying() {
    this.amountForBuying -= 1;
  }
}
