class Fruit {
  final String name;
  final String price;
  final String image;
  final String amount;

  Fruit(
    this.name,
    this.price,
    this.image,
    this.amount,
  );

  Fruit.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        image = parsedJson['image'],
        amount = parsedJson['amount'],
        price = parsedJson['price'];
}
