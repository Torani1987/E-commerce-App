import 'dart:convert';

import 'package:final_project/properties_app/prop.dart';
import 'package:final_project/view/homePage.dart';
import 'package:final_project/view_model/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email, password;
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  _showMsg(msg) {
    final snackbar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

//slicing belum selesai
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      key: _scaffoldkey,
      backgroundColor: black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                'Sign In',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Username* ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'email': email, 'password': password};

    var res = await NetworkAuth().auth(data, '/auth/login');
    var body = json.decode(res.body);
    if (body['code'] == "00") {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['data']['token']));
      localStorage.setString('user', json.encode(body['data']['user']));
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    } else {
      _showMsg(body['info']);
    }
    setState(() {
      _isLoading = false;
    });
  }
}
