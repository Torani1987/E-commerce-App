import 'package:final_project/model/product_model.dart';

class CartModel {
  final int id;
  final int userId;
  final int productId;
  final int quantity;
  final Product cartProduct;

  CartModel(
      {required this.id,
      required this.cartProduct,
      required this.productId,
      required this.quantity,
      required this.userId});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      id: json['id'],
      cartProduct: Product.fromJson(json['product']),
      productId: json['product_id'],
      quantity: json['qty'],
      userId: json['user_id']);
}

class ProductCategory {
  final int id;
  final String name;

  ProductCategory({required this.id, required this.name});

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(id: json['id'] ?? 0, name: json['name'] ?? "null");

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
