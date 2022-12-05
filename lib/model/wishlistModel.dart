import 'package:final_project/model/product_model.dart';

class WishList {
  final int id;
  final int userId;
  final int productId;
  final Product cartProduct;

  WishList(
      {required this.id,
      required this.cartProduct,
      required this.productId,
      required this.userId});

  factory WishList.fromJson(Map<String, dynamic> json) => WishList(
      id: json['id'],
      cartProduct: Product.fromJson(json['product']),
      productId: json['product_id'],
      userId: json['user_id']);
}
