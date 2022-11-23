import 'dart:convert';

import 'package:final_project/model/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FetchProduct {
  var data = [];
  List<Product> results = [];
  Future<List<Product>> getDataProduct() async {
    final String url = 'https://api1.sib3.nurulfikri.com/api/barang';
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String token = await jsonDecode(localStorage.getString('token')!);
    final response = await http.get(Uri.parse(url), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      results = data['data'].map((e) => Product.fromJson(e)).toList();
      print(data);
    } else {
      print('api error');
    }
    return results;
  }
}
