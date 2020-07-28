class Product {
  final String productName;
  final double productPrice;
  final String productImage;
  final String productAmount;
  final double productRessource;

  Product(this.productName, this.productPrice, this.productImage,
      this.productAmount, this.productRessource);

  Product.fromJson(Map<String, dynamic> parsedJson)
      : productName = parsedJson['name'],
        productImage = parsedJson['image'],
        productAmount = parsedJson['amount'],
        productRessource = parsedJson['ressource'],
        productPrice = parsedJson['price'];
}
