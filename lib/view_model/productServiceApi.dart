import 'dart:convert';
import 'package:final_project/model/ProductModel.dart';
import 'package:final_project/view_model/globalService.dart';
import 'package:http/http.dart' as http;

class FetchProduct {
  var data = [];
  List<Product> results = [];
  String productUrl = Base_url + '/barang';
  Future<List<Product>> getRegisterList() async {
    final response = await http.get(Uri.parse(productUrl));
    try {
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        results = data.map((e) => Product.fromJson(e)).toList();
      } else {
        print('Api Error');
      }
    } catch (e) {}
    return results;
  }
}
