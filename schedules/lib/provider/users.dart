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
}
