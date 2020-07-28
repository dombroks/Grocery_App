import 'dart:math';

class Product {
  final int productId;
  final String productName;
  final double productPrice;
  final String productImage;
  final String productAmount;

  Product(this.productName, this.productPrice, this.productImage,
      this.productAmount, this.productId);
}
