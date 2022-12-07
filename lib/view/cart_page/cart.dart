import 'package:final_project/model/cartModel.dart';
import 'package:final_project/view_model/cart_service.dart';
import 'package:final_project/view_model/transaction_service.dart';
import 'package:flutter/material.dart';

class cartPage extends StatefulWidget {
  cartPage({super.key});

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  Cartrepository cartrepository = Cartrepository();
  FetchTransaction _transaction = FetchTransaction();
  @override
  void initState() {
    super.initState();
    cartrepository.getDataCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: null,
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder<List<CartModel>>(
          future: cartrepository.getDataCart(),
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
                        Text(
                          data[index].quantity.toString(),
                          maxLines: 2,
                        ),
                        IconButton(
                            onPressed: () {
                              _showDialog();
                            },
                            icon: Icon(Icons.delete))
                      ]),
                    );
                  }));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
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
                    _transaction.addCart(alamatCtrl.text);
                  },
                  child: Text('CHECKOUT'))
            ],
          ),
        );
      },
    );
  }
}
