

class Product {
  final int productId;
  final String productName;
  final double productPrice;
  final String productImage;
  final String productAmount;

  Product(this.productName, this.productPrice, this.productImage,
      this.productAmount, this.productId);

  Product.fromJson(Map<String, dynamic> parsedJson)
      : productId = parsedJson['id'],
        productName = parsedJson['name'],
        productImage = parsedJson['image'],
        productAmount = parsedJson['amount'],
        productPrice = parsedJson['price'];
}
