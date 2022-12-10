import 'dart:convert';

import 'package:final_project/view/checkout_success_page.dart';
import 'package:final_project/view_model/cart_service.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../view_model/transaction_service.dart';

class DetailProductPage extends StatefulWidget {
  DetailProductPage({required this.product, super.key});
  Product product;
  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  _showMsg(msg) {
    final snackbar = SnackBar(
      backgroundColor: Colors.black,
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(11),
        child: Column(
          children: [
            Stack(
              children: [
                Flexible(
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey[300]),
                    child: Image.network(
                      widget.product.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //back button
                Positioned(
                  top: 10,
                  left: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 280,
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.product.name!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //price
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Rp ${widget.product.price!.toInt().toString()}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(
                    thickness: 1.2,
                  ),
                  //description
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.product.description!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1.2,
                  ),
                  //review
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          "Rating",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber.shade900,
                          ),
                          const Text(
                            " ${4.6}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //list tile of review
                ],
              ),
            ),
            //button see all review
          ],
        ),
      ),
      bottomNavigationBar: Card(
        elevation: 0,
        child: Row(
          children: <Widget>[
            Expanded(
              child: OutlinedButton.icon(
                  icon: const Icon(Icons.add_shopping_cart_outlined),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green,
                  ),
                  onPressed: () async {
                    final response = await Cartrepository()
                        .addCart(widget.product.id.toString(), '1');
                    if (response.statusCode == 200) {
                      final body = jsonDecode(response.body);
                      _showMsg('Success added to cart');
                    }
                  },
                  label: Text('Add to Cart',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ))),
            ),
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    _showDialog();
                  },
                  child: Text('Checkout',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog() {
    TextEditingController alamatCtrl = TextEditingController();
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      constraints: const BoxConstraints(
        maxHeight: 500,
        minHeight: 200,
      ),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return AnimatedPadding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  controller: alamatCtrl,
                  decoration: InputDecoration(
                    hintText: "Enter Your Address",
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(
                      Icons.add_business,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    FetchTransaction().addCart(alamatCtrl.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckoutSuccessPage(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    'CHECKOUT',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
