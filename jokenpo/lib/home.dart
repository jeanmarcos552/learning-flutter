import 'package:flutter/material.dart';
import 'package:jokenpo/homeGame.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Joken Po"),
      ),
      body: const HomeGame(),
    );
  }
}

