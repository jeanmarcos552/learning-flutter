import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:expenses/providers/transactions.dart';
import 'package:expenses/views/home/home_form.dart';
import 'package:expenses/views/home/home_list.dart';
import 'package:expenses/views/home/home_shart.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Transactions(),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Transactions transactions = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
      ),
      body: Container(
        color: Colors.grey[100],
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children:  <Widget>[
            const HomeChart(),
            HomeList(dataList: transactions.all),
            const HomeForm(),
          ],
        ),
      ),
    );
  }
}
