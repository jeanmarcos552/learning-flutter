import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:expenses/providers/transactions.dart';
import 'package:expenses/views/home/home_form.dart';
import 'package:expenses/views/home/home_list.dart';

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

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Expenses"),
        ),
        body: Container(
          color: Colors.grey[100],
          child: SingleChildScrollView(
            child: Column(
              children: [
                // const HomeChart(),
                const HomeForm(),
                HomeList(dataList: transactions.all),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
