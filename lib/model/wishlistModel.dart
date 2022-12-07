import 'package:final_project/model/product_model.dart';

class WishList {
  final int id;
  final int userId;
  final int productId;
  final Product? wishProduct;

  WishList(
      {required this.id,
      required this.wishProduct,
      required this.productId,
      required this.userId});

  factory WishList.fromJson(Map<String, dynamic> json) => WishList(
      id: json['id'],
      wishProduct: Product.fromJson(json['product']),
      productId: json['product_id'],
      userId: json['user_id']);
}
