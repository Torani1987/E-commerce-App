import 'package:final_project/model/wishlist_model.dart';
import 'package:final_project/view_model/wishlist_service.dart';
import 'package:flutter/material.dart';

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
    wishlistRepository.getDataCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<WishList>>(
          future: wishlistRepository.getDataCart(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: Container(
                        color: Colors.grey,
                        height: 100,
                        width: 100,
                        child: Image.network(data[index].cartProduct.image!),
                      ),
                      title: Text(
                        data[index].cartProduct.name!,
                        maxLines: 2,
                      ),
                      subtitle: Text(
                        data[index].id.toString(),
                        maxLines: 2,
                      ),
                      trailing: Column(children: [
                        IconButton(
                            onPressed: () => WishlistRepository()
                                .delCart(data[index].id.toString())
                                .then((value) => setState(
                                      () {},
                                    )),
                            icon: const Icon(Icons.delete))
                      ]),
                    );
                  }));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
