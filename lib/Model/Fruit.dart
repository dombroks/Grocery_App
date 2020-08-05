class Fruit {
  final String Name;
  final String Price;
  final String Image;
  final String Amount;

  Fruit(
    this.Name,
    this.Price,
    this.Image,
    this.Amount,
  );

  Fruit.fromJson(Map<String, dynamic> parsedJson)
      : Name = parsedJson['name'],
        Image = parsedJson['image'],
        Amount = parsedJson['amount'],
        Price = parsedJson['price'];
}
