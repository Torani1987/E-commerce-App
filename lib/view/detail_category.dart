import 'package:final_project/view_model/category_service.dart';
import 'package:flutter/material.dart';

import '../model/category_model.dart';

class DetailCategoryPage extends StatefulWidget {
  final String id;
  const DetailCategoryPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailCategoryPage> createState() => _DetailCategoryPageState();
}

class _DetailCategoryPageState extends State<DetailCategoryPage> {
  final CategoryService _categoryService = CategoryService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Category',
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder(
          future: _categoryService.getProductByCategory(widget.id),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final data = snapshot.data as Category;
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      data.name.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: data.products.map((product) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(product.image.toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name.toString(),
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
                                    'Rp. ${product.price.toString()}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
