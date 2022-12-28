import 'dart:convert';

import 'package:final_project/model/category_model.dart';
import 'package:final_project/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../model/cart_model.dart';

class CategoryService {
  late Map<String, dynamic> data;

  String url = 'https://aki.nurulfikri.com/api/category/';
  late Category result;
  Future<Category> getProductByCategory(String idCategory) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String token = await jsonDecode(localStorage.getString('token')!);
    final response = await http.get(Uri.parse(url + idCategory), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final snapshot = jsonDecode(response.body);
      data = snapshot['data'] as Map<String, dynamic>;
      result = Category.fromJson(data);
      return result;
    } else {
      return Category(id: 2, name: 'not fount', products: [
        Product(
            id: 0,
            name: 'name',
            categoryId: 0,
            image: 'image',
            price: 0,
            description: 'description',
            stock: 0,
            isFavorite: false)
      ]);
    }
  }

  Future addCart(String? id, String? qty) async {
    final data = {'product_id': id, 'qty': qty};
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String token = await jsonDecode(localStorage.getString('token')!);
    final resp = await http.post(Uri.parse(url), body: data, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final body = jsonDecode(resp.body);
  }

  Future delCart(String? id) async {
    String delUrl = '$url/$id';
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String token = await jsonDecode(localStorage.getString('token')!);
    final response = await http.delete(Uri.parse(delUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    final body = jsonDecode(response.body);
  }
}
