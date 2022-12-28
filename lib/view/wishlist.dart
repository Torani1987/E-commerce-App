import 'package:final_project/model/wishlist_model.dart';
import 'package:final_project/view/cart.dart';
import 'package:final_project/view/detail.dart';
import 'package:final_project/view_model/cart_service.dart';
import 'package:final_project/view_model/wishlist_service.dart';
import 'package:flutter/material.dart';

import '../controller/product_controller.dart';
import 'detail_product_page.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  WishlistRepository wishlistRepository = WishlistRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<WishList>>(
        future: wishlistRepository.getDataWishlist(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (snapshot.hasData) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 8),
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
                                        data[index].cartProduct!.image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index].cartProduct!.name!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Rp. ${data[index].cartProduct!.price!.toInt().toString()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Stock : ${data[index].cartProduct!.stock!}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () async {
                                  await wishlistRepository
                                      .delCart(data[index].id.toString());

                                  if (!mounted) return;

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.only(bottom: 30),
                                    content: Text(
                                        'Produk telah dihapus dari wishlist'),
                                  ));
                                  setState(() {});
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        backgroundColor: Colors.black),
                                    child: Text(
                                      'Add to cart',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge
                                          ?.copyWith(color: Colors.white),
                                    ),
                                    onPressed: () async {
                                      final Cartrepository repo =
                                          Cartrepository();
                                      await repo.addCart(
                                          data[index]
                                              .cartProduct!
                                              .id
                                              .toString(),
                                          '1');

                                      if (!mounted) return;

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: const Text(
                                            'Produk berhasil ditambahkan ke keranjang'),
                                        action: SnackBarAction(
                                            label: 'Lihat',
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          const CartPage()));
                                            }),
                                      ));
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      final id = data[index].id;

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (c) => Details(
                            product: data[index].cartProduct!,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
