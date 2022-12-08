import 'dart:convert';
// import 'package:final_project/view_model/globalService.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkAuth {
  final String _url = 'https://api1.sib3.nurulfikri.com';

  String? token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    return token;
  }

  auth(data, apiURL) async {
    var fullUrl = _url + apiURL;
    final response = await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
    return response;
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  _getCategory() async {
    token = _getToken();
    final response =
        await http.get(Uri.parse('$_url/api/category'), headers: _setHeaders());
    return response;
  }
}
