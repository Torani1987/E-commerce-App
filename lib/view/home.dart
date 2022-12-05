import 'dart:convert';

import 'package:final_project/model/product_model.dart';
import 'package:final_project/view/login_page/login.dart';
import 'package:final_project/view_model/auth_service.dart';
import 'package:final_project/view_model/get_product.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  String name = '';
  String usertoken = '';
  final FetchProduct product = FetchProduct();
  void initState() {
    super.initState();
    _loadUserData();
    product.getDataProduct();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
          future: product.getDataProduct(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: Container(
                        color: Colors.grey,
                        height: 100,
                        width: 100,
                        child: Image.network(data[index].image!),
                      ),
                      title: Text(
                        data[index].name!,
                        maxLines: 2,
                      ),
                    );
                  }));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  void _logout() async {
    var res = await NetworkAuth().getData('/logout');
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    if (mounted) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user')!);
    var token = jsonDecode(localStorage.getString('token')!);

    if (user != null) {
      setState(() {
        name = user['email'];
        usertoken = token;
      });
    }
  }
}
