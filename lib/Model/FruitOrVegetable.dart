class FruitOrVegetable {
  final String Name;
  final double Price;
  final String Image;
  final String Amount;
 

  FruitOrVegetable(
      this.Name, this.Price, this.Image, this.Amount,);

  FruitOrVegetable.fromJson(Map<String, dynamic> parsedJson)
      : Name = parsedJson['name'],
        Image = parsedJson['image'],
        Amount = parsedJson['amount'],
        Price = parsedJson['price'];
}
