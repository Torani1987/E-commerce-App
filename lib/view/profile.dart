import 'dart:convert';

import 'package:final_project/view/login_page.dart';
import 'package:final_project/view/transaction.dart';
import 'package:final_project/view/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project/view/detail_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _loadUserData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final data = snapshot.data!;
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Row(
                    children: [
                      Text(
                        "4SHOP",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Color(
                          0xffF5F5F5,
                        ),
                      ),
                      child: Flexible(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 48,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: ClipOval(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.network(
                                      "https://i.imgur.com/BoN9kdC.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['name'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data['email'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data['phone'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Center(
                              child: Flexible(
                                child: IconButton(
                                  onPressed: () {
                                    Get.to(const DetailProfilePage());
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "My Activity",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  //transaction list, wishlist,review, theme, logout
                  Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.receipt_long_outlined),
                        title: const Text("Transaction List"),
                        // trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TransactionPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 4),
                      ListTile(
                        leading: const Icon(Icons.favorite_outline_outlined),
                        title: const Text("Wishlist"),
                        // trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WishlistPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 4),
                      ListTile(
                        leading: const Icon(Icons.star_border),
                        title: const Text("Review"),
                        // trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {},
                      ),
                      const SizedBox(height: 4),
                      ListTile(
                        leading: const Icon(Icons.dark_mode_outlined),
                        title: const Text("Theme"),
                        // trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {},
                      ),
                      const SizedBox(height: 4),
                      ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text("Logout"),
                        // trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                              (route) => false);
                        },
                      ),
                    ],
                  ),
                ],
              );
            }
          }),
    );
  }

  Future _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final user = jsonDecode(localStorage.getString('user')!);
    print(user);
    return user;
  }
}
