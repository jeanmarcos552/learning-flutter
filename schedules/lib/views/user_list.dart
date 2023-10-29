import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedules/components/user_title.dart';
import 'package:schedules/data/dummy_data.dart';
import 'package:schedules/models/User.dart';
import 'package:schedules/provider/users.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World!"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              users.put(
                const User(
                  name: "Maria",
                  email: "email",
                  avatarUrl: "",
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ListView.builder(
          itemBuilder: (context, index) => UserTitle(users.byIndex(index)),
          itemCount: users.count,
        ),
      ),
    );
  }
}

/*
instala o provider
cria pasta /provider
  - cria classe with ChangeNotifier
  - get and seters
 */
