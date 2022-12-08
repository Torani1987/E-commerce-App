import 'package:flutter/material.dart';

class review extends StatefulWidget {
  @override
  State<review> createState() => _reviewState();
}

class _reviewState extends State<review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Review',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 320,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF5F5F5),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 23,
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
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
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Air Jordan High Travis Scoot",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Torani",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Column(
                    children: [
                      Text("Bagus Sekali"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Tedy",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Column(
                    children: [
                      Text("Bagus Sekali"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Yulia",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Column(
                    children: [
                      Text("Bagus Sekali"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Putra",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Column(
                    children: [
                      Text("Bagus Sekali"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Ilham",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Column(
                    children: [
                      Text("Bagus Sekali"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Udin",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Column(
                    children: [
                      Text("Bagus Sekali"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
