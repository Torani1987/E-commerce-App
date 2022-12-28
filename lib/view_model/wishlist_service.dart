import 'dart:convert';

import 'package:final_project/model/wishlist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class WishlistRepository {
  var data = [];
  List<WishList> results = [];
  String url = 'https://aki.nurulfikri.com/api/wishlist';

  Future<List<WishList>> getDataWishlist() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String token = await jsonDecode(localStorage.getString('token')!);
    final response = await http.get(Uri.parse(url), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      data = body['data'];
      results = data.map((e) => WishList.fromJson(e)).toList();

      return results;
    } else {
      return [];
    }
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
