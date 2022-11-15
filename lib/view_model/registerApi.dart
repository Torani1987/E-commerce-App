import 'dart:convert';

import 'package:final_project/model/registerModel.dart';
import 'package:http/http.dart' as http;

class FetchRegister {
  var data = [];
  List<Register> results = [];
  String registerUrl = 'https://api1.sib3.nurulfikri.com/api/register';
  Future<List<Register>> getRegisterList() async {
    final response = await http.get(Uri.parse(registerUrl));
    try {
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        results = data.map((e) => Register.fromjson(e)).toList();
      } else {
        print('Api Error');
      }
    } catch (e) {}
    return results;
  }
}

void addData(){
  
}
