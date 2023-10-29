import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedules/provider/users.dart';
import 'package:schedules/routes/app_routes.dart';
import 'package:schedules/views/user_form.dart';
import 'package:schedules/views/user_list.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoute.HOME: (_) => const UserList(),
          AppRoute.USER_FORM: (_) => GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: const UserForm(),
              ),
        },
      ),
    );
  }
}
