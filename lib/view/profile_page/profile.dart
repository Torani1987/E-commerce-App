import 'package:final_project/view/login_page/login.dart';
import 'package:final_project/view/transaction.dart';
import 'package:final_project/view/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project/view/profile_page/detail_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Text(
                "Sneakpick!",
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
                        "Yulia Taryana",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "+628123456789",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "yuliataryana.yt@gmail.com",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Center(
                    child: IconButton(
                      onPressed: () {
                        Get.to(const DetailProfilePage());
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  )
                ],
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
                        builder: (context) => const Login(),
                      ),
                      (route) => false);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
