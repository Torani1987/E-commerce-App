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
}
