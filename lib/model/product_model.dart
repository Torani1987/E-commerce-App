import 'dart:convert';

List<Product> productfromJson(String str) =>
    List<Product>.from(jsonDecode(str).map((x) => Product.fromJson(x)));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int? id;
  String? name;
  int? categoryId;
  String? image;
  double? price;
  String? description;
  int? stock;
  bool isFavorite;
  Product({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.image,
    required this.price,
    required this.description,
    required this.stock,
    required this.isFavorite,
  });
  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['id'] ?? 1,
      name: json['name'].toString(),
      categoryId: json['category_id'] ?? 1,
      image: json['image'].toString(),
      price: json['harga'].toDouble() ?? 0,
      description: json['deskripsi'].toString(),
      stock: json["stock"] ?? 2,
      isFavorite: false);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category_id': categoryId,
        'image': image,
        'harga': price,
        'deskripsi': description,
        'stock': stock,
      };
}
