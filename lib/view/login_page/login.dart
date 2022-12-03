import 'dart:convert';
import 'package:final_project/properties_app/prop.dart';
import 'package:final_project/view/register_page/register.dart';
import 'package:final_project/view/main_page.dart';
import 'package:final_project/view_model/auth_service.dart';
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
  bool _isHidden = true;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          '4SHOP',
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sign In', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
              Text(
                'Sign In',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: 'Username',
                  style: Theme.of(context).textTheme.headlineSmall,
                  children: const [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'Email',
                  labelStyle: Theme.of(context).textTheme.headlineMedium,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (emailValue) {
                  if (emailValue!.isEmpty) {
                    return 'Please Enter Your Email';
                  }
                  email = emailValue;
                  return null;
                },
              ),
              const SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: 'Password',
                  style: Theme.of(context).textTheme.headlineSmall,
                  children: const [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                obscureText: _isHidden,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'Password',
                  labelStyle: Theme.of(context).textTheme.headlineMedium,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isHidden = !_isHidden;
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye_outlined),
                    color: Colors.grey,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                validator: (passwordValue) {
                  if (passwordValue!.isEmpty) {
                    return 'Please Enter Your Password';
                  }
                  password = passwordValue;
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
                  _isLoading ? 'Processing..' : 'Login',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text(
                      'Not Account Yet ?',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(decoration: TextDecoration.underline),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                  )
                ],
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
