import 'package:expenses/components/card_app.dart';
import 'package:expenses/providers/transactions.dart';
import 'package:expenses/views/home_form.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

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

    // This widget is the root of your application.
    final Map<int, String> dayOfWeek = {
      1: "Dom",
      2: "Seg",
      3: "Ter",
      4: "Qua",
      5: "Quin",
      6: "Sext",
      7: "Sáb",
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expanses"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          child: Column(
            children: <Widget>[
              CardApp(
                color: Colors.purple[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var i = 1; i <= 7; i++)
                      Column(
                        children: <Widget>[
                          const Text(
                            "ola",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            dayOfWeek[i].toString(),
                            style: TextStyle(
                              color: Colors.grey[100],
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              CardApp(
                color: Colors.blue[400]!,
                child: Column(
                  children: transactions.all.map((e) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              "R\$ ${e.value.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    e.name.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Text(
                                  DateFormat("d 'de' MMM 'de' y")
                                      .format(e.date),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const HomeForm(),
            ],
          ),
        ),
      ),
    );
  }
}
