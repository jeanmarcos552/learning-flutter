import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedules/models/User.dart';
import 'package:schedules/provider/users.dart';
import 'package:schedules/views/user_form.dart';

class UserTitle extends StatelessWidget {
  final User user;

  const UserTitle(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    final avatar = user.avatarUrl.isEmpty
        ? const CircleAvatar(
            child: Icon(Icons.person_3),
          )
        : CircleAvatar(
            child: Image(image: NetworkImage(user.avatarUrl)),
          );

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserForm(),
                      settings: RouteSettings(
                        arguments: user,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  users.delete(user);
                },
                icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
