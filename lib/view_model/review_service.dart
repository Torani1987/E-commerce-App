import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:final_project/model/review_response_model.dart';
import 'package:http/http.dart' as http;

class FetchReview {
  var data = [];
  String url = 'https://aki.nurulfikri.com/api/transaksi';
  List<ReviewResponseModel> results = [];
  Future<List<ReviewResponseModel>> getTransaction({String? query}) async {
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
      results = data.map((e) => ReviewResponseModel.fromJson(e)).toList();
      print(data);
    } else {
      print('api error');
    }
    return results;
  }
}
