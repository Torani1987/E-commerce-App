import 'package:final_project/model/transactionModel.dart';
import 'package:final_project/view_model/transaction_service.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  FetchTransaction _transaction = FetchTransaction();
  @override
  void initState() {
    super.initState();
    _transaction.getTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Transaction>>(
          future: _transaction.getTransaction(),
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
                        child: Image.network(data[index].products[0].image),
                      ),
                      title: Text(
                        data[index].products[0].pivot.qty.toString(),
                        maxLines: 2,
                      ),
                      subtitle: Text(
                        data[index].products[0].id.toString(),
                        maxLines: 2,
                      ),
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
}
