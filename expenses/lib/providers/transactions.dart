import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class Transactions with ChangeNotifier {
  final Map<String, Transaction> _item = {};

  Transactions() {
    _item.putIfAbsent(
      "1",
      () => Transaction(
        date: DateTime.now().subtract(const Duration(days: 3)),
        id: 1,
        name: "Conta de Luz",
        value: 100.34,
      ),
    );
    _item.putIfAbsent(
      "2",
      () => Transaction(
        date: DateTime.now().subtract(const Duration(days: 4)),
        id: 2,
        name: "Conta de Água",
        value: 34.4,
      ),
    );
  }

  List<Transaction> get all {
    return [..._item.values];
  }

  List<Transaction> lastItensByParam(int? param) {
    final newList = [..._item.values].reversed.toList();
    final Map<String, Transaction> newItem = {};
    final int newParam = param ?? 2;

    for (var element in newList) {
      if (newItem.length < newParam) {
        newItem.putIfAbsent(element.id.toString(), () => element);
      }
    }
    return [...newItem.values];
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
