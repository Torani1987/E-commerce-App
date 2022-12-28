import 'package:final_project/model/detail_product.dart';
import 'package:final_project/view/detail_product.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({
    super.key,
    required this.listProduct,
  });
  final List<DetailProduct> listProduct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkouts"),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Sender Address",
                        style: Theme.of(context).textTheme.headline6),
                  ],
                ),
                const Divider(
                  thickness: 2,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xffF5F5F5),

                    // border: Border.all(color: Colors.grey),
                    // borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Name"),
                            Text("Address"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(": Muhammad Fikri"),
                            Text(": Jl. Kebon Jeruk Raya No. 1"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                //create list of procut
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listProduct.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Color(0xffF5F5F5),
                        // border: Border.all(color: Colors.grey),
                        // borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        tileColor: const Color(0xffD9D9D9),
                        leading: Container(
                          color: Colors.grey,
                          height: 70,
                          width: 60,
                          child: Image.network(
                            listProduct[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          listProduct[index].name,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.black),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("1 Item"),
                            Text(listProduct[index].harga.asCurrencyFormat),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0xffF5F5F5),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Total"),
                Text(
                  listProduct
                      .map((e) => e.harga)
                      .reduce((value, element) => value + element)
                      .asCurrencyFormat,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white),
              onPressed: () {
                //show dialog confirmation with message
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Checkout Item"),
                      content:
                          const Text("Are you sure you want to buy this item?"),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("  Checkout  "),
            ),
          ],
        ),
      ),
    );
  }
}
