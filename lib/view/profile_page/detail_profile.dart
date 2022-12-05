import 'package:final_project/view/profile_page/change_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProfilePage extends StatelessWidget {
  const DetailProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CircleAvatar(
            radius: 48,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ClipOval(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network("https://i.imgur.com/BoN9kdC.png",
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Change Photo Profile",
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text("Info Profile",
                  style: Theme.of(context).textTheme.titleLarge),
              const Icon(Icons.info_outline_rounded, size: 32),
            ],
          ),
          InkWell(
            onTap: () {
              Get.to(const ChangeProfilePage(
                  type: ProfileType.name, currentValue: "Yulia Taryana"));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("Name",
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text("Yulia Taryana",
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  const Icon(Icons.chevron_right_outlined, size: 24),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(const ChangeProfilePage(
                  type: ProfileType.email,
                  currentValue: "yuliataryana.yt@gmail.com"));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("Email",
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text("yuliataryana.yt@gmail.com",
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  const Icon(Icons.chevron_right_outlined, size: 24),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(const ChangeProfilePage(
                  type: ProfileType.phone, currentValue: "+628123456789"));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("Phone Number",
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text("+628123456789",
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  const Icon(Icons.chevron_right_outlined, size: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
