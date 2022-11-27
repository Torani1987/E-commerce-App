import 'dart:convert';

import 'package:final_project/properties_app/prop.dart';
import 'package:final_project/view/Login.dart';
import 'package:final_project/view/homePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view_model/AuthService.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String? email, password, name, passwordConfirm, no_hp;
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.left,
                )),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Sign Up',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Nama',
                  border: OutlineInputBorder()),
              validator: (namaValue) {
                if (namaValue!.isEmpty) {
                  return 'Silahkan Masukkan Nama';
                }
                name = namaValue;
                return null;
              },
            ),
            const SizedBox(
              height: 26,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
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
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  labelText: 'No Handphone',
                  border: OutlineInputBorder()),
              validator: (no_hpValue) {
                if (no_hpValue!.isEmpty) {
                  return 'Silahkan Masukkan No Handphone';
                }
                no_hp = no_hpValue;
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
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: Icon(_secureText
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  labelText: 'Password',
                  border: OutlineInputBorder()),
              validator: (passwordValue) {
                if (passwordValue!.isEmpty) {
                  return 'Silahkan Masukkan Password';
                }
                password = passwordValue;
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
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: Icon(_secureText
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  labelText: 'Konfirmasi Password',
                  border: OutlineInputBorder()),
              validator: (passwordConfirmValue) {
                if (passwordConfirmValue!.isEmpty) {
                  return 'Silahkan Masukkan Konfirmasi Password';
                }
                if (passwordConfirmValue != password) {
                  return 'Konfirmasi password tidak sama';
                }
                passwordConfirm = passwordConfirmValue;
                return null;
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Colors.black),
                child: Text(
                  _isLoading ? 'Processing..' : 'Register',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _register();
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Text(
                    'Already Have a Account ? Login ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  void _register() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'name': name,
      'email': email,
      'handphone': no_hp,
      'password': password,
      'password_confirmation': passwordConfirm
    };

    var res = await NetworkAuth().auth(data, '/api/register');
    var body = json.decode(res.body);
    if (res.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['data']['token']));
      localStorage.setString('user', json.encode(body['data']['user']));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
      _showMsg(body['info']);
    }
    setState(() {
      _isLoading = false;
    });
  }
}