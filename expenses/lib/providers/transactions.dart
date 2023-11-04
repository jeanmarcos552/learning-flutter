import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class Transactions with ChangeNotifier {
  final Map<String, Transaction> _item = {};

  Transactions() {
    _item.putIfAbsent(
      "id",
      () => Transaction(
        date: DateTime.now(),
        id: "1",
        name: "Conta de Luz",
        value: 100.34,
      ),
    );
  }

  List<Transaction> get all {
    return [..._item.values];
  }

  void put(Transaction transaction) {
    _item.putIfAbsent(
      transaction.id,
      () => Transaction(
          id: transaction.id,
          name: transaction.name,
          date: transaction.date,
          value: transaction.value),
    );
  }
}
