import 'dart:convert';

import 'package:final_project/view/checkout_success.dart';
import 'package:final_project/view_model/cart_service.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../view_model/transaction_service.dart';

class Details extends StatefulWidget {
  Details({required this.product, super.key});
  Product product;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  _showMsg(msg) {
    final snackbar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(11),
        child: Container(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 360 / 288,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        // height: 288,
                        // width: double.infinity,
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
                            widget.product.price!.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //rating anf total review
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              Text(
                                " ${4.6}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            " Reviewers",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
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
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
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
                          child: Text(
                            "Review",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            Text(
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
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              width: 156,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  onPressed: () async {
                    final response = await Cartrepository()
                        .addCart(widget.product.id.toString(), '1');
                    if (response.statusCode == 200) {
                      final body = jsonDecode(response.body);
                      _showMsg(body['info']);
                    }
                  },
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  ))),
          Container(
              width: 156,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.grey.shade300)),
                  onPressed: () {
                    _showDialog();
                  },
                  child: Text(
                    'Checkout',
                    style: TextStyle(color: Colors.green.shade300),
                  ))),
        ],
      ),
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
