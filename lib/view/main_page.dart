import 'package:final_project/view/cart_page/cart.dart';
import 'package:final_project/widget/Searchbar.dart';
import 'package:flutter/material.dart';
import 'package:final_project/properties_app/prop.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:final_project/view/home.dart';
import 'package:final_project/view/profile_page/profile.dart';
import 'package:final_project/view/transaction.dart';
import 'package:final_project/view/wishlist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:final_project/view_model/auth_service.dart';

import 'login_page/login.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  List<Widget> body = [
    const HomePage(),
    WishlistPage(),
    const TransactionPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: black),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: 'Find Something?',
              labelStyle: Theme.of(context).textTheme.headlineMedium,
              // labelStyle: const TextStyle(color: Colors.black),
              suffixIcon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            onTap: () {
              showSearch(context: context, delegate: Search());
            }),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.category_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => cartPage()));
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: body[index],
      bottomNavigationBar: ConvexAppBar(
        activeColor: Colors.black,
        backgroundColor: Colors.white,
        color: Colors.black,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.favorite, title: 'Wishlist'),
          TabItem(icon: Icons.receipt_long, title: 'Transaction'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        onTap: (int i) {
          setState(() {
            index = i;
          });
        },
      ),
    );
  }
}
