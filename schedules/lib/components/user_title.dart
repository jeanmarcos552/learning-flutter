import 'package:flutter/material.dart';
import 'package:schedules/models/User.dart';

class UserTitle extends StatelessWidget {
  final User user;

  const UserTitle(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
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
                  debugPrint("Editar");
                },
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  debugPrint("deletar");
                },
                icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
