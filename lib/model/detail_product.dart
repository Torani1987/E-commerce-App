// To parse this JSON data, do
//
//     final detailProductModel = detailProductModelFromJson(jsonString);

import 'dart:convert';

DetailProductModel detailProductModelFromJson(String str) =>
    DetailProductModel.fromJson(json.decode(str));

String detailProductModelToJson(DetailProductModel data) =>
    json.encode(data.toJson());

class DetailProductModel {
  DetailProductModel({
    required this.code,
    required this.info,
    required this.data,
  });

  String code;
  String info;
  DetailProduct data;

  factory DetailProductModel.fromJson(Map<String, dynamic> json) =>
      DetailProductModel(
        code: json["code"],
        info: json["info"],
        data: DetailProduct.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "info": info,
        "data": data.toJson(),
      };
}

class DetailProduct {
  DetailProduct({
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
    required this.deletedAt,
    required this.category,
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
  dynamic deletedAt;
  Category category;

  factory DetailProduct.fromJson(Map<String, dynamic> json) => DetailProduct(
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
        deletedAt: json["deleted_at"],
        category: Category.fromJson(json["category"]),
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
        "deleted_at": deletedAt,
        "category": category.toJson(),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
