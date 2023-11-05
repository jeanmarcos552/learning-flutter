import 'package:expenses/components/card_app.dart';
import 'package:expenses/providers/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeList extends StatelessWidget {
  final List<dynamic>? dataList;

  const HomeList({
    super.key,
    this.dataList,
  });

  @override
  Widget build(BuildContext context) {
    final Transactions transactions = Provider.of(context);

    return CardApp(
      color: Colors.blue[400]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: (dataList ?? transactions.lastItensByParam(2)).map((e) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: Text(
                    "R\$ ${e?.value.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          e.name.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat("d 'de' MMM 'de' y").format(e.date),
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
