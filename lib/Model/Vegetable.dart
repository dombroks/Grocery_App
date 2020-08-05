class Vegetable {
  final String name;
  final String price;
  final String image;
  final String amount;

  Vegetable(
    this.name,
    this.price,
    this.image,
    this.amount,
  );

  Vegetable.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        image = parsedJson['image'],
        amount = parsedJson['amount'],
        price = parsedJson['price'];
}
