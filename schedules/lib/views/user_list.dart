import 'package:flutter/material.dart';
import 'package:schedules/components/user_title.dart';
import 'package:schedules/data/dummy_data.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final users = {...dummyUsers};

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World!"),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ListView.builder(
          itemBuilder: (context, index) =>
              UserTitle(users.values.elementAt(index)),
          itemCount: users.length,
        ),
      ),
    );
  }
}
