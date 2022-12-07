import 'dart:convert';

import 'package:final_project/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view_model/auth_service.dart';

class LoginController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  String? email, password;
}
