class Product {
  int? id;
  String? name;
  int? categoryId;
  String? image;
  double? price;
  String? description;
  num? stock;
  Product({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.image,
    required this.price,
    required this.description,
    required this.stock,
  });
  Product.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.categoryId = json['category_id'];
    this.image = json['image'];
    this.price = json['harga'];
    this.description = json['deskripsi'];
    this.stock = json['stock'];
  }
}
