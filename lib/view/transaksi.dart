import 'package:flutter/material.dart';

class transaksi extends StatefulWidget {
  @override
  State<transaksi> createState() => _transaksiState();
}

class _transaksiState extends State<transaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 230,
                decoration: BoxDecoration(
                  color: Color(0xFFFF5F5F5),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.shopping_bag,
                          color: Colors.green,
                          size: 30,
                        ),
                        Text(
                          "3 Oct 2022",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 35,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xfffCBFED7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Paid",
                              style: TextStyle(
                                color: Color(0xfff2B9542),
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.black,
                          size: 25,
                        ),
                      ],
                    ),
                    SizedBox(height: 28.0),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.scaleDown,
                                  image: AssetImage('assets/images/sepatu.jpg'),
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Nike Air Jordan High Travis Scoot",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              width: 100.0,
                              child: Text(
                                "1 item",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "total shopping",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Rp. 33.999.000",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 90,
                          height: 35,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xff2B9542),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Buy Again",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 230,
                decoration: BoxDecoration(
                  color: Color(0xFFFF5F5F5),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.shopping_bag,
                          color: Colors.green,
                          size: 30,
                        ),
                        Text(
                          "3 Oct 2022",
                          style: TextStyle(fontSize: 14),
                        ),
                        Spacer(),
                        Container(
                          height: 35,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xfffFFC5C5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Unpaid",
                              style: TextStyle(
                                color: Color(0xfffFF0000),
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.black,
                          size: 25,
                        ),
                      ],
                    ),
                    SizedBox(height: 28.0),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.scaleDown,
                                  image: AssetImage('assets/images/sepatu.jpg'),
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Nike Air Force 1 Low Shadow Sail Pale Ivory",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              width: 100.0,
                              child: Text(
                                "1 item",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "total shopping",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Rp. 2.399.000",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 90,
                          height: 35,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xff2B9542),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Buy Again",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
