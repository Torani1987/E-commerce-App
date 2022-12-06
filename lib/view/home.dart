import 'dart:convert';

import 'package:final_project/model/product_model.dart';
import 'package:final_project/view/login_page/login.dart';
import 'package:final_project/view_model/auth_service.dart';
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
  final FetchProduct product = FetchProduct();

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
                children: const [
                  CategoryTile(
                      icon: Icon(Icons.checkroom, size: 32), name: 'Clothes'),
                  CategoryTile(
                      icon: Icon(Icons.charging_station, size: 32),
                      name: 'Electronic'),
                  CategoryTile(
                      icon: Icon(Icons.fastfood, size: 32), name: 'Food'),
                  CategoryTile(
                      icon: Icon(Icons.chair, size: 32), name: 'Furniture'),
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
                            mainAxisExtent: 250,
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
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
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
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            'Rp. ${data[index].price!.toInt().toString()}',
                                          ),
                                          Text(
                                              'Stock : ${data[index].stock.toString()}')
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

  // void _logout() async {
  //   var res = await NetworkAuth().getData('/logout');
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   localStorage.remove('user');
  //   localStorage.remove('token');
  //   if (mounted) {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => const LoginPage()));
  //   }
  // }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, required this.name, required this.icon})
      : super(key: key);

  final String name;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
      onTap: () {},
    );
  }
}
