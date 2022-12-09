import 'package:final_project/model/cart_model.dart';
import 'package:final_project/view/checkout_success.dart';
import 'package:final_project/view_model/cart_service.dart';
import 'package:final_project/view_model/wishlist_service.dart';
import 'package:flutter/material.dart';

import '../view_model/transaction_service.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Cartrepository cartrepository;
  @override
  void initState() {
    cartrepository = Cartrepository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: FutureBuilder<List<CartModel>>(
          future: cartrepository.getDataCart(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (snapshot.hasData) {
              return Container(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          data[index].cartProduct.image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data[index].cartProduct.name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Stock : ${data[index].cartProduct.stock!.toString()}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                              color: Colors.black,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Rp. ${data[index].cartProduct.price!.toInt().toString()}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                              color: Colors.black,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OutlinedButton(
                                  onPressed: () async {
                                    await cartrepository
                                        .delCart(data[index].id.toString());
                                    setState(() {});
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        duration: Duration(milliseconds: 1500),
                                        content:
                                            Text('Berhasil di hapus dari Cart'),
                                      ),
                                    );

                                    setState(() {});
                                  },
                                  style: OutlinedButton.styleFrom(
                                    // ignore: prefer_const_constructors
                                    side: BorderSide(color: Colors.red),
                                  ),
                                  child: Text(
                                    'Delete from Cart',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDialog();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                  child: Text(
                                    'Checkout Now',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  _showDialog() {
    TextEditingController alamatCtrl = TextEditingController();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            children: [
              TextField(
                controller: alamatCtrl,
                decoration: InputDecoration(
                  hintText: "masukkan alamat ",
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    FetchTransaction().addCart(alamatCtrl.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutSuccessPage(),
                        ));
                  },
                  child: Text('CHECKOUT'))
            ],
          ),
        );
      },
    );
  }
}
