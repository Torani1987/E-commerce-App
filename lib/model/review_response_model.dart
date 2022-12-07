// To parse this JSON data, do
//
//     final reviewResponseModel = reviewResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ReviewResponseModel reviewResponseModelFromJson(String str) =>
    ReviewResponseModel.fromJson(json.decode(str));

String reviewResponseModelToJson(ReviewResponseModel data) =>
    json.encode(data.toJson());

class ReviewResponseModel {
  ReviewResponseModel({
    required this.code,
    required this.info,
    required this.totalReview,
    required this.data,
  });

  final String code;
  final String info;
  final int totalReview;
  final List<Review> data;

  factory ReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      ReviewResponseModel(
        code: json["code"],
        info: json["info"],
        totalReview: json["total review"],
        data: List<Review>.from(json["data"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "info": info,
        "total review": totalReview,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Review {
  Review({
    required this.id,
    required this.productId,
    required this.userId,
    required this.star,
    required this.review,
    required this.image,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  final int id;
  final int productId;
  final int userId;
  final int star;
  final String review;
  final String image;
  final String imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        productId: json["product_id"],
        userId: json["user_id"],
        star: json["star"],
        review: json["review"],
        image: json["image"],
        imagePath: json["image_path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "user_id": userId,
        "star": star,
        "review": review,
        "image": image,
        "image_path": imagePath,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.handphone,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
  });

  final int id;
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final String handphone;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        handphone: json["handphone"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "handphone": handphone,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "role": role,
      };
}
