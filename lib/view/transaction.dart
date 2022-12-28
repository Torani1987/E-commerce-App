import 'package:final_project/global/global_prop.dart';
import 'package:final_project/view/detail.dart';
import 'package:final_project/view/home.dart';
import 'package:final_project/view/main_page.dart';
import 'package:flutter/material.dart';

import '../model/transaction_model.dart';
import '../view_model/transaction_service.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  FetchTransaction _transaction = FetchTransaction();
  @override
  void initState() {
    super.initState();
    _transaction.getTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Transaction>>(
            future: _transaction.getTransaction(),
            builder: (context, snapshot) {
              final data = snapshot.data;
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 230,
                          decoration: BoxDecoration(
                            color: const Color(0xffff5f5f5),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.shopping_bag,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                  const Text(
                                    "9 Des 2022",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 35,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xfffffc5c5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Paid',
                                        style: TextStyle(
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.more_vert,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 28.0),
                              Row(
                                children: [
                                  const SizedBox(width: 10),
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
                                            image: NetworkImage(
                                                data[index].products[0].image),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 200,
                                        child: Text(
                                          data[index].products[0].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15.0),
                                      Container(
                                        width: 100.0,
                                        child: Text(
                                          ' ${data[index].products[0].pivot.qty.toString()} item',
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
                              const SizedBox(height: 12.0),
                              Row(
                                children: const [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(width: 10),
                                  Text(
                                    "Rp ${data[index].total}",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 90,
                                    height: 35,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff2B9542),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MainPage(),
                                            ));
                                      },
                                      child: const Text(
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
                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
