import 'package:expenses/components/card_app.dart';
import 'package:expenses/providers/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeList extends StatelessWidget {
  final List<dynamic>? dataList;
  final int? paginate;

  const HomeList({
    super.key,
    this.dataList,
    this.paginate,
  });

  @override
  Widget build(BuildContext context) {
    final Transactions transactions = Provider.of(context);
    final data = transactions.lastItensByParam(paginate ?? 2);

    if (dataList == null && data.isEmpty) {
      return const CardApp(
        color: Colors.white,
        child: Center(
          child: Text("Nenhum cadastro encontrado!"),
        ),
      );
    }

    return CardApp(
      color: Colors.blue[400]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: (dataList ?? data).map((e) {
          return ListTile(
            leading: CircleAvatar(
              radius: 40,
              child: FittedBox(
                child: Text(
                  e?.value.toStringAsFixed(0),
                  style: const TextStyle(),
                ),
              ),
            ),
            title: Text(
              e.name,
              style: TextStyle(
                color: Colors.grey[100],
              ),
            ),
            subtitle: Text(
              DateFormat('d MMM y').format(e.date),
              style: TextStyle(
                color: Colors.grey[100],
              ),
            ),
            tileColor: Colors.red,
          );
        }).toList(),
      ),
    );
  }
}
