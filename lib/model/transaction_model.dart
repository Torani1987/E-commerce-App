import 'dart:convert';

List<Transaction> registerFromJson(String str) => List<Transaction>.from(
    json.decode(str).map((x) => Transaction.fromJson(x)));

String registerToJson(List<Transaction> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transaction {
  Transaction({
    required this.id,
    required this.total,
    required this.status,
    required this.alamat,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.products,
  });

  int id;
  int total;
  String status;
  String alamat;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Transactionproduct> products;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        total: json["total"],
        status: json["status"],
        alamat: json["alamat"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        products: List<Transactionproduct>.from(
            json["products"].map((x) => Transactionproduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total": total,
        "status": status,
        "alamat": alamat,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Transactionproduct {
  Transactionproduct({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.image,
    required this.imagePath,
    required this.harga,
    required this.deskripsi,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  int id;
  String name;
  int categoryId;
  String image;
  String imagePath;
  int harga;
  String deskripsi;
  int stock;
  DateTime createdAt;
  DateTime updatedAt;

  Pivot pivot;

  factory Transactionproduct.fromJson(Map<String, dynamic> json) =>
      Transactionproduct(
        id: json["id"],
        name: json["name"],
        categoryId: json["category_id"],
        image: json["image"],
        imagePath: json["image_path"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        stock: json["stock"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_id": categoryId,
        "image": image,
        "image_path": imagePath,
        "harga": harga,
        "deskripsi": deskripsi,
        "stock": stock,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  Pivot({
    required this.transactionId,
    required this.productId,
    required this.qty,
  });

  int transactionId;
  int productId;
  int qty;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        transactionId: json["transaction_id"],
        productId: json["product_id"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "transaction_id": transactionId,
        "product_id": productId,
        "qty": qty,
      };
}
