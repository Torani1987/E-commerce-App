import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Review',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 23,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Image(
                            image: AssetImage("asset/images/spt.jpg"),
                            width: 270,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Air Jordan High Travis Scoot",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Torani",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: const [
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                  ],
                ),
                const SizedBox(height: 3),
                const Text(
                  "Bagus Sekali",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Tedy",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: const [
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                  ],
                ),
                const SizedBox(height: 3),
                const Text(
                  "Bagus Sekali",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Yulia",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: const [
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                  ],
                ),
                const SizedBox(height: 3),
                const Text(
                  "Bagus Sekali",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Putra",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: const [
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                  ],
                ),
                const SizedBox(height: 3),
                const Text(
                  "Bagus Sekali",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Ilham",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: const [
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                  ],
                ),
                const SizedBox(height: 3),
                const Text(
                  "Bagus Sekali",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Udin",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: const [
                    Icon(Icons.star, size: 15),
                    Icon(Icons.star, size: 15),
                  ],
                ),
                const SizedBox(height: 3),
                const Text(
                  "Bagus Sekali",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
