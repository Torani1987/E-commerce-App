import 'dart:convert';

import 'package:final_project/model/detail_product.dart';
import 'package:final_project/model/product_model.dart';
import 'package:final_project/model/review_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FetchProduct {
  var data = [];
  List<Product> results = [];
  Future<List<Product>> getDataProduct() async {
    const String url = 'https://api1.sib3.nurulfikri.com/api/barang';
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String token = await jsonDecode(localStorage.getString('token')!);
    final response = await http.get(Uri.parse(url), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      data = jsonDecode(jsonEncode(body['data']));
      results = data.map((e) => Product.fromJson(e)).toList();
      print(data);
    } else {
      print('api error');
    }
    return results;
  }

  final mapOfDetailProduct = <int, DetailProductModel>{};
  Future<DetailProductModel> getDetailProduct(int id) async {
    // if (mapOfDetailProduct.containsKey(id)) {
    //   return mapOfDetailProduct[id]!;
    // } else {
    final String url = 'https://api1.sib3.nurulfikri.com/api/barang/$id';
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String token = await jsonDecode(localStorage.getString('token')!);
    final response = await http.get(Uri.parse(url), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final result = detailProductModelFromJson(response.body);
      // mapOfDetailProduct[id] = result;
      return result;
    } else {
      throw Exception('Failed to load data');
    }
    // }
  }

  Future<ReviewResponseModel> getReviews(int id) async {
    final String url = 'https://api1.sib3.nurulfikri.com/api/review/$id';
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String token = await jsonDecode(localStorage.getString('token')!);
    final response = await http.get(Uri.parse(url), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final result = reviewResponseModelFromJson(response.body);
      return result;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
