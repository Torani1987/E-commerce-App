import 'package:final_project/view/onboarding_page/onboarding.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (x) => const OnBoarding(),
          ),
        );
      },
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "4SHOP",
          style: Theme.of(context).textTheme.headline1?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
