import 'package:final_project/view/detail_transaction_page.dart';
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
  final FetchTransaction _transaction = FetchTransaction();
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
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailTransaction(
                                transaction: data[index],
                              ),
                            ));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              children: <Widget>[
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
                                    SizedBox(
                                      height: 35,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.grey.shade200,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          data[index].status,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
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
                                const Divider(),
                                Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Center(
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.scaleDown,
                                              image: NetworkImage(data[index]
                                                  .products[0]
                                                  .image),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12.0),
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            data[index].products[0].name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 15.0),
                                          SizedBox(
                                            width: 100.0,
                                            child: Text(
                                              ' ${data[index].products[0].pivot.qty.toString()} item',
                                              style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12.0),
                                Row(
                                  children: const [
                                    SizedBox(width: 10),
                                    Text(
                                      "Total shopping :",
                                      style: TextStyle(
                                        fontSize: 14,
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
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: 90,
                                      height: 35,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const MainPage(),
                                              ));
                                        },
                                        child: const Text(
                                          "Buy Again",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
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
                    );
                  },
                );
              } else {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: LinearProgressIndicator(
                      color: Colors.black,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                );
              }
            }));
  }
}
