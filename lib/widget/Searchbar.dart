import 'package:final_project/model/product_model.dart';
import 'package:final_project/view_model/get_product.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final FetchProduct _productsearch = FetchProduct();
  
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Product>>(
        future: _productsearch.getDataProduct(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapshot.data;
          return ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  color: Colors.grey,
                  height: 100,
                  width: 100,
                  child: data[index].image!.isNotEmpty
                      ? Image.network(
                          data[index].image!.toString(),
                          width: 100,
                          fit: BoxFit.cover,
                        )
                      : const Center(),
                ),
                title: Text(
                  data[index].name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  data[index].description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search Your Favorite Item'),
    );
  }
}
