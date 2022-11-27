import 'dart:convert';

List<Login> productfromJson(String str) =>
    List<Login>.from(jsonDecode(str).map((x) => Login.fromJson(x)));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  String? email;
  String? password;
  Login({
    required this.email,
    required this.password,
  });
  factory Login.fromJson(Map<String, dynamic> json) => Login(
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
