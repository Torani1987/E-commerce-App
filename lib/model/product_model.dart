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
  Product({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.image,
    required this.price,
    required this.description,
    required this.stock,
  });
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'].toString(),
        categoryId: json['category_id'],
        image: json['image'].toString(),
        price: json['harga'].toDouble(),
        description: json['deskripsi'].toString(),
        stock: json["stock"],
      );

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
