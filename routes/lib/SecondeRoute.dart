import 'package:flutter/material.dart';
import 'package:routes/tertiary.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TertiaryRoute(),
                ),
              );
            },
            child: const Text("Tertiary Route")),
      ),
    );
  }
}