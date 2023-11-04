import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class Transactions with ChangeNotifier {
  final Map<String, Transaction> _item = {};

  Transactions() {
    _item.putIfAbsent(
      "1",
      () => Transaction(
        date: DateTime.now(),
        id: 1,
        name: "Conta de Luz",
        value: 100.34,
      ),
    );
    _item.putIfAbsent(
      "2",
      () => Transaction(
        date: DateTime.now(),
        id: 2,
        name: "Conta de Água",
        value: 34.4,
      ),
    );
  }

  List<Transaction> get all {
    return [..._item.values];
  }

  int count() {
    return _item.values.length;
  }

  Transaction byIndex(int i) {
    return _item.values.elementAt(i);
  }

  int lastId() {
    if (_item.isNotEmpty) {
      return _item.values.last.id;
    }
    return 0;
  }

  void put(Transaction transaction) {
    _item.putIfAbsent(
      transaction.id.toString(),
      () => Transaction(
          id: transaction.id,
          name: transaction.name,
          date: transaction.date,
          value: transaction.value),
    );
    notifyListeners();
  }
}
