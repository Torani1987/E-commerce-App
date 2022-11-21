import 'package:final_project/model/registerModel.dart';
import 'package:final_project/view/Login.dart';
import 'package:final_project/view/Register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // gunakan textstyle ini karna udah saya definisiin jadi tidak perlu membuat textstyke yang baru lagi
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'montserrat',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
          bodyMedium: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
          bodySmall: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Login(),
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = RegisterPage();
    } else {
      child = Login();
    }

    return Scaffold(
      body: child,
    );
  }
}
