import 'package:expenses/views/home/home_chart.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:expenses/providers/transactions.dart';
import 'package:expenses/views/home/home_form.dart';
import 'package:expenses/views/home/home_list.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Transactions(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
          ),
          textTheme: TextTheme(
              displayMedium: GoogleFonts.actor(),
              bodyLarge: GoogleFonts.openSans()),
        ),
        home: const HomePage(),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void openForm() {
      showModalBottomSheet(
        context: context,
        builder: (index) => const HomeForm(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
        actions: [
          IconButton(
            onPressed: () => openForm(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HomeChart(),
            HomeList(paginate: 6),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => openForm(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
