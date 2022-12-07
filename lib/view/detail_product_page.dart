import 'dart:ffi';

import 'package:final_project/view/main_page.dart';
import 'package:final_project/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

import '../controller/product_controller.dart';
import 'checkout_page.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppbar(context),
      body: ListView(
        children: [
          Obx(() {
            final product = ProductController();
            if (product.isDetailLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (product.detailErrorMessage.value.isNotEmpty) {
              return Center(
                child: Text(product.detailErrorMessage.value),
              );
            } else {
              final data = product.mapOfDetailProduct[id];
              return Container(
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
                              decoration:
                                  BoxDecoration(color: Colors.grey[300]),
                              child: Image.network(
                                data!.image,
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
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  data.name,
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
                                  data.harga.asCurrencyFormat,
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
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      " ${4.6}",
                                      style: const TextStyle(
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
                                  "${product.mapOfReviewProduct[id]?.totalReview} Reviewers",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.2,
                          ),
                          //description
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Description",
                                  style: const TextStyle(
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
                                    data.deskripsi,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.2,
                          ),
                          //review
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Review (${product.mapOfReviewProduct[id]?.totalReview})",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    " ${4.6}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          //list tile of review
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: (product.mapOfReviewProduct[id]?.data
                                            .length ??
                                        0) <
                                    2
                                ? product.mapOfReviewProduct[id]?.data.length
                                : product.mapOfReviewProduct[id]?.data
                                        .getRange(0, 2)
                                        .length ??
                                    0,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    product.mapOfReviewProduct[id]?.data[index]
                                            .image ??
                                        "",
                                  ),
                                ),
                                title: Text(product.mapOfReviewProduct[id]
                                        ?.data[index].user.name ??
                                    ""),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: List.generate(
                                          product.mapOfReviewProduct[id]
                                                  ?.data[index].star ??
                                              0,
                                          (i) => Icon(Icons.star)),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(product
                                                  .mapOfReviewProduct[id]
                                                  ?.data[index]
                                                  .review ??
                                              " "),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: Text(product
                                        .mapOfReviewProduct[id]
                                        ?.data[index]
                                        .createdAt
                                        .dateStringHistory ??
                                    ""),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    //button see all review
                    product.mapOfReviewProduct[id]?.data.isEmpty ?? true
                        ? Container()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => ReviewPage(
                                  //       id: id,
                                  //     ),
                                  //   ),
                                  // );
                                },
                                child: const Text("See All Review"),
                              ),
                            ],
                          ),
                  ],
                ),
              );
            }
            // return Container(
            //   child: Column(
            //     children: [
            //       Container(
            //         height: 200,
            //         width: 200,
            //         child: Image.network(
            //           product.image!,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //       Text(product.name!),
            //       Text(product.price.toString()),
            //       Text(product.description!),
            //     ],
            //   ),
            // );
          }),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        height: 100,
        //create button checkout(green), and add to cart(white,green border)
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //button checkout
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Obx(() {
                  final isNotActive = ProductController()
                          .isDetailLoading
                          .value ||
                      ProductController().detailErrorMessage.value.isNotEmpty;
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white),
                    onPressed: isNotActive
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckoutPage(
                                  listProduct: [
                                    ProductController().mapOfDetailProduct[id]!
                                  ],
                                ),
                              ),
                            );
                            //add to cart
                            // cart.addProductToCart(
                            //   id: id,
                            //   name: data.nama,
                            //   price: data.harga,
                            //   image: data.image,
                            //   quantity: 1,
                            // );
                            //go to checkout page
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const CheckoutPage(),
                            //   ),
                            // );
                          },
                    child: const Text("Checkout"),
                  );
                }),
              ),
            ),
            //button add to cart
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  onPressed: () {
                    //add to cart
                    // cart.addProductToCart(
                    //   id: id,
                    //   name: data.nama,
                    //   price: data.harga,
                    //   image: data.image,
                    //   quantity: 1,
                    // );
                    //show snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("Product added to cart"),
                        action: SnackBarAction(
                          label: "Undo",
                          onPressed: () {
                            // cart.removeProductFromCart(id);
                          },
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  child: const Text("Add to Cart"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension DateExt on DateTime {
  String get dateStringHistory {
    // return with format minutes,hours,days,months,years ago
    final now = DateTime.now();
    final difference = now.difference(this);
    if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hours ago";
    } else if (difference.inDays < 30) {
      return "${difference.inDays} days ago";
    } else if (difference.inDays < 365) {
      return "${difference.inDays ~/ 30} months ago";
    } else {
      return "${difference.inDays ~/ 365} years ago";
    }
  }
}

extension IntExt on int {
  String get asCurrencyFormat {
    return NumberFormat.currency(locale: "id", symbol: "Rp ", decimalDigits: 0)
        .format(this);
  }
}
