import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../model/transaction_model.dart';

class FetchTransaction {
  var data = [];
  String url = 'https://api1.sib3.nurulfikri.com/api/transaksi';
  List<Transaction> results = [];
  Future<List<Transaction>> getTransaction({String? query}) async {
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
      results = data.map((e) => Transaction.fromJson(e)).toList();
    } else {
    }
    return results;
  }

  Future addCart(String? alamat) async {
    final data = {'alamat': alamat};
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String token = await jsonDecode(localStorage.getString('token')!);
    final resp = await http.post(Uri.parse(url), body: data, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final body = jsonDecode(resp.body);
  }
}
