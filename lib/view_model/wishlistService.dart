import 'dart:convert';

import 'package:final_project/model/wishlistModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class WishlistRepository {
  var data = [];
  List<WishList> results = [];
  String url = 'https://api1.sib3.nurulfikri.com/api/wishlist';
  Future<List<WishList>> getDataCart() async {
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
      results = data.map((e) => WishList.fromJson(e)).toList();
      print(data);
    } else {
      print('api error');
    }
    return results;
  }

  Future addWishlist(String? id) async {
    final data = {
      'product_id': id,
    };
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String token = await jsonDecode(localStorage.getString('token')!);
    final resp = await http.post(Uri.parse(url), body: data, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final body = jsonDecode(resp.body);
    print(body['info']);
  }

  Future delCart(String? id) async {
    String delUrl = url + '/$id';
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String token = await jsonDecode(localStorage.getString('token')!);
    final response = await http.delete(Uri.parse(delUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    final body = jsonDecode(response.body);
    print(body['info']);
  }
}
