import 'package:final_project/properties_app/prop.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      backgroundColor: black,
      body: SafeArea(
          child: Column(
        children: [Text('Sign in ')],
      )),
    );
  }
}
