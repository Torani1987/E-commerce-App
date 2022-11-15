import 'package:final_project/model/registerModel.dart';
import 'package:final_project/view/Register.dart';
import 'package:flutter/material.dart';

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
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
              bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}
