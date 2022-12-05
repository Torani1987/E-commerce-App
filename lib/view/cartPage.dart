import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: null,
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Column(children: [
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 138,
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromARGB(189, 246, 244, 244),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 117,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(203, 202, 198, 198),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Container(
                                        height: 70,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Image.asset('images/login.png')),
                                    title: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // diisi dengan product dari api
                                        Text("Nama Product"),
                                        Text("1 item"),
                                        Text("Rp.123xxx"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 82,
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: () {},
                                              splashColor: Color.fromARGB(
                                                  247, 142, 23, 14),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Center(
                                                child: Text("Back to Wishlist",
                                                    style: TextStyle(
                                                      fontSize: 9,
                                                      fontFamily: "montserrat",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          height: 20,
                                          width: 82,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  247, 142, 23, 14),
                                            ),
                                          ),
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: () {},
                                              splashColor: Color.fromARGB(
                                                  247, 142, 23, 14),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Center(
                                                child: Text(
                                                  "Delete from Cart",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily: "montserrat",
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        247, 142, 23, 14),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                          height: 20,
                                          width: 82,
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 3, 153, 81),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  255, 3, 153, 81),
                                            ),
                                          ),
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: () {},
                                              splashColor: Color.fromARGB(
                                                  255, 6, 228, 121),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Center(
                                                child: Text("Checkout Now",
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontFamily: "montserrat",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ]);
            }),
      ),
    );
  }
}
