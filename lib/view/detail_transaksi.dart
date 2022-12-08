import 'package:final_project/view/transaksi.dart';
import 'package:flutter/material.dart';

class detrans extends StatefulWidget {
  @override
  State<detrans> createState() => _detransState();
}

class _detransState extends State<detrans> {
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => transaksi()),
            );
          },
        ),
        title: Text(
          'Detail Transaction',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 28,
                decoration: BoxDecoration(
                  color: Color(0xFFFF5F5F5),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 6,
                      height: 14,
                      child: ColoredBox(color: Color(0xFFF2B9542)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Done")
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Detail Product",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                child: Row(
                  children: [
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
                              image: AssetImage("assets/images/sepatu.jpg"),
                              fit: BoxFit.cover,
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
                        SizedBox(height: 12),
                        Container(
                          child: Text(
                            "1 item",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.0),
              Row(
                children: [
                  Text(
                    "total shopping",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Rp. 33.999.000",
                    style: TextStyle(
                      fontSize: 12,
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => detrans()),
                        );
                      },
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
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dispatch Info",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xfff808080),
                                ),
                              ),
                              SizedBox(width: 66),
                              Text(
                                "Muhammad Torani",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 9),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Address",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xfff808080),
                                ),
                              ),
                              SizedBox(width: 55),
                              Text(
                                "Buah Batu,Perum Bandung Indah No 24 Kota Bandung,Jawa Barat",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 9),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Total Price",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xfff808080),
                                ),
                              ),
                              SizedBox(width: 44),
                              Text(
                                "33.999.000",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 9),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Total Discount",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xfff808080),
                                ),
                              ),
                              SizedBox(width: 27),
                              Text(
                                "1.299.000",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Shop",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "32.700.00",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                height: 200.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFF5F5F5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
