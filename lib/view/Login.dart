import 'dart:convert';
import 'package:final_project/view_model/auth_service.dart';
import 'package:final_project/view/Register.dart';
import 'package:final_project/view/main_page.dart';
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
  String? email, password;
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(children: [
              const SizedBox(height: 20),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.left,
                  )),
              const SizedBox(
                height: 7,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 16
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email),
                    labelText: 'Email',
                    border: OutlineInputBorder()),
                validator: (emailValue) {
                  if (emailValue!.isEmpty) {
                    return 'Silahkan Masukkan Email';
                  }
                  email = emailValue;
                  return null;
                },
              ),
              const SizedBox(
                height: 26,
              ),
              TextFormField(
                obscureText: _secureText,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                        onPressed: showHide,
                        icon: Icon(_secureText
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    labelText: 'Password',
                    border: const OutlineInputBorder()),
                validator: (passwordValue) {
                  if (passwordValue!.isEmpty) {
                    return 'Silahkan Masukkan Password';
                  }
                  password = passwordValue;
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: Colors.black),
                  child: Text(
                    _isLoading ? 'Processing..' : 'Login',
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _login();
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text(
                      'Not Account Yet ? Register',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                  )
                ],
              )
            ]),
          ),
        ));
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'email': email, 'password': password};

    var res = await NetworkAuth().auth(data, '/api/login');
    var body = json.decode(res.body);
    if (res.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['data']['token']));
      localStorage.setString('user', json.encode(body['data']['user']));
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
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
