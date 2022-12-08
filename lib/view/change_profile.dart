import 'package:flutter/material.dart';

class ChangeProfilePage extends StatelessWidget {
  const ChangeProfilePage(
      {super.key, required this.type, required this.currentValue});
  final ProfileType type;
  final String currentValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(type.hint),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: currentValue,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: type.hint,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {},
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum ProfileType {
  name,
  phone,
  email,
  password,
}

extension ProfileTypeExtension on ProfileType {
  String get title {
    switch (this) {
      case ProfileType.name:
        return "Change Name";
      case ProfileType.phone:
        return "Change Phone";
      case ProfileType.email:
        return "Change Email";
      case ProfileType.password:
        return "Change Password";
    }
  }

  String get hint {
    switch (this) {
      case ProfileType.name:
        return "Use your real name to facilitate verification. The name will appear in a few pages.";
      case ProfileType.phone:
        return "Enter your phone";
      case ProfileType.email:
        return "Enter your email";
      case ProfileType.password:
        return "Enter your password";
    }
  }
}
