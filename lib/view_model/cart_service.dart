import 'dart:convert';

// import 'package:final_project/global/global_prop.dart';
// import 'package:final_project/model/category_model.dart';
import 'package:final_project/model/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart ' as http;

class Cartrepository {
  var data = [];
  List<CartModel> results = [];
  String url = 'https://api1.sib3.nurulfikri.com/api/keranjang';
  Future<List<CartModel>> getDataCart() async {
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
      results = data.map((e) => CartModel.fromJson(e)).toList();
    } else {}
    return results;
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
    return resp;
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
