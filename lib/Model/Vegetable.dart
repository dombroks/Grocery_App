class Vegetable {
  final String Name;
  final String Price;
  final String Image;
  final String Amount;

  Vegetable(
    this.Name,
    this.Price,
    this.Image,
    this.Amount,
  );

  Vegetable.fromJson(Map<String, dynamic> parsedJson)
      : Name = parsedJson['name'],
        Image = parsedJson['image'],
        Amount = parsedJson['amount'],
        Price = parsedJson['price'];
}
