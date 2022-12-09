import 'dart:convert';

import 'package:final_project/model/product_model.dart';
import 'package:final_project/view/detail_category.dart';
import 'package:final_project/view_model/category_service.dart';
import 'package:final_project/view_model/get_product.dart';
import 'package:final_project/view_model/wishlist_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';
  String usertoken = '';

  bool isFavorite = false;
  final FetchProduct product = FetchProduct();
  final CategoryService category = CategoryService();

  @override
  void initState() {
    super.initState();
    _loadUserData();
    product.getDataProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8),
              Text(
                'Category',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const DetailCategoryPage(id: '43')));
                      },
                      icon: const Icon(Icons.storefront, size: 32),
                      name: 'Fashion'),
                  CategoryTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const DetailCategoryPage(id: '23')));
                      },
                      icon: const Icon(Icons.charging_station, size: 32),
                      name: 'Electronic'),
                  CategoryTile(
                    icon: const Icon(Icons.fastfood, size: 32),
                    name: 'Food',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  const DetailCategoryPage(id: '102')));
                    },
                  ),
                  CategoryTile(
                    icon: const Icon(Icons.chair, size: 32),
                    name: 'Furniture',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  const DetailCategoryPage(id: '22')));
                    },
                  ),
                ],
              ),
              FutureBuilder<List<Product>>(
                  future: product.getDataProduct(),
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    if (snapshot.hasData) {
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 260,
                            mainAxisSpacing: 14.0,
                            crossAxisSpacing: 20.0,
                          ),
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 180,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              NetworkImage(data[index].image!),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data[index].name!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium
                                                      ?.copyWith(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  'Rp. ${data[index].price!.toInt().toString()}',
                                                ),
                                                Text(
                                                    'Stock : ${data[index].stock.toString()}')
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              final WishlistRepository
                                                  wishlistRepository =
                                                  WishlistRepository();

                                              wishlistRepository.addWishlist(
                                                  data[index].id.toString());
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                margin:
                                                    EdgeInsets.only(bottom: 30),
                                                content: Text(
                                                    'Produk telah ditambahkan wishlist'),
                                              ));

                                              setState(() {
                                                data[index].isFavorite =
                                                    !data[index].isFavorite;
                                              });
                                            },
                                            icon: data[index].isFavorite
                                                ? const Icon(Icons.favorite)
                                                : const Icon(
                                                    Icons.favorite_outline),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                // TODO: Navigate To Detail Screen Here
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
                  }),
            ],
          ),
        ));
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user')!);
    var token = jsonDecode(localStorage.getString('token')!);

    if (user != null) {
      setState(() {
        name = user['email'];
        usertoken = token;
      });
    }
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {Key? key, required this.name, required this.icon, required this.onTap})
      : super(key: key);

  final String name;
  final Widget icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          icon,
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
