import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:schedules/data/dummy_data.dart';
import 'package:schedules/models/User.dart';

class Users with ChangeNotifier {
  final Map<String, User> _item = {...dummyUsers};

  List<User> get all {
    return [..._item.values];
  }

  int get count {
    return _item.length;
  }

  User byIndex(int i) {
    return _item.values.elementAt(i);
  }

  void put(User user) {
    final id = Random().nextDouble().toString();

    if (user.id != null &&
        user.id!.trim().isNotEmpty &&
        _item.containsKey(user.id)) {
      _item.update(
        user.id ?? id,
        (value) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    } else {
      _item.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          avatarUrl: "",
        ),
      );
    }
    notifyListeners();
  }

  void delete(User user) {
    _item.remove(user.id);
    notifyListeners();
  }
}
