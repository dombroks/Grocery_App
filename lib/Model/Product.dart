class FruitOrVegetable {
  final String Name;
  final double Price;
  final String Image;
  final String Amount;
  final double Ressource;

  FruitOrVegetable(
      this.Name, this.Price, this.Image, this.Amount, this.Ressource);

  FruitOrVegetable.fromJson(Map<String, dynamic> parsedJson)
      : Name = parsedJson['name'],
        Image = parsedJson['image'],
        Amount = parsedJson['amount'],
        Ressource = parsedJson['ressource'],
        Price = parsedJson['price'];
}
