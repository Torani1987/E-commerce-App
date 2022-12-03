import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:final_project/view/login_page/login.dart';
import 'package:final_project/view_model/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:final_project/properties_app/prop.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String? email, password, name, passwordConfirm, noHp;
  bool _secureText = true;
  final TextEditingController _emailCtrl = TextEditingController();

  _showHidden() {
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Sign Up', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Text(
              'Sign Up',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: 'Name',
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
                hintText: 'Name',
                hintStyle: Theme.of(context).textTheme.headlineMedium,
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: (emailValue) {
                if (emailValue!.isEmpty) {
                  return 'Please Enter Your Name';
                }
                email = emailValue;
                return null;
              },
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: 'Email',
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
                hintText: 'Email',
                hintStyle: Theme.of(context).textTheme.headlineMedium,
                // labelText: 'Email',
                // labelStyle: Theme.of(context).textTheme.headlineMedium,
                prefixIcon: const Icon(
                  Icons.alternate_email,
                  color: Colors.grey,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: _emailCtrl,
              autovalidateMode: AutovalidateMode.always,
              validator: (value) {
                final bool isValid = EmailValidator.validate(value!);
                if (_emailCtrl.text.isEmpty) {
                  return 'Please Enter Your Email';
                } else if (isValid == false) {
                  return 'Your format is wrong';
                }
                return null;
              },
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: 'Phone Number',
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
                hintText: 'Phone Number',
                hintStyle: Theme.of(context).textTheme.headlineMedium,
                prefixIcon: const Icon(
                  Icons.phone_android,
                  color: Colors.grey,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: (noHpValue) {
                if (noHpValue!.isEmpty) {
                  return 'Silahkan Masukkan No Handphone';
                }
                noHp = noHpValue;
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
              obscureText: _secureText,
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
                hintText: 'Password',
                hintStyle: Theme.of(context).textTheme.headlineMedium,
                prefixIcon: const Icon(Icons.key, color: Colors.grey),
                suffixIcon: IconButton(
                  onPressed: _showHidden,
                  icon: Icon(
                      _secureText ? Icons.visibility : Icons.visibility_off),
                  color: Colors.grey,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              validator: (passwordValue) {
                if (passwordValue!.isEmpty) {
                  return 'Please Enter Your Password';
                }
                password = passwordValue;
                return null;
              },
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: 'Confirm Password',
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
              obscureText: _secureText,
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
                hintText: 'Confirm Password',
                hintStyle: Theme.of(context).textTheme.headlineMedium,
                prefixIcon: const Icon(Icons.key, color: Colors.grey),
                suffixIcon: IconButton(
                  onPressed: _showHidden,
                  icon: Icon(
                      _secureText ? Icons.visibility : Icons.visibility_off),
                  color: Colors.grey,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              validator: (passwordConfirmValue) {
                if (passwordConfirmValue!.isEmpty) {
                  return 'Please Enter Your Confirm Password';
                }
                if (passwordConfirmValue != password) {
                  return 'Confirm Password Not The Same';
                }
                passwordConfirm = passwordConfirmValue;
                return null;
              },
            ),
            const SizedBox(height: 32),
            SizedBox(
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
                  style: const TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _register();
                  }
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Text(
                    'Already Have a Account ?',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                )
              ],
            ),
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
      'handphone': noHp,
      'password': password,
      'password_confirmation': passwordConfirm
    };

    var res = await NetworkAuth().auth(data, '/api/register');
    var body = json.decode(res.body);
    if (res.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['data']['token']));
      localStorage.setString('user', json.encode(body['data']['user']));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
      _showMsg(body['info']);
    }
    setState(() {
      _isLoading = false;
    });
  }
}
