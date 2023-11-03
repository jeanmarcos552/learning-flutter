import 'dart:math';

import 'package:flutter/material.dart';
import 'package:routes/SecondeRoute.dart';
import 'package:routes/state.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: FrasesDia(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Page Home'),
      ),
      body: const Home(),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.green,
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ola",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "ola",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "ola",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: ElevatedButton(
            child: const Text('Open route'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              );
            },
          ),
        ),
        Center(
          child: ElevatedButton(
            child: const Text('Route State'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PageState()),
              );
            },
          ),
        ),
      ],
    );
  }
}

class FrasesDia extends StatefulWidget {
  const FrasesDia({super.key});

  @override
  State<FrasesDia> createState() => _FrasesDiaState();
}

class _FrasesDiaState extends State<FrasesDia> {
  var frases = ["primeira frase", "Segunda frase"];

  var currFrase = "Bom dia";

  void _changeFrase() {
    var value = Random().nextInt(2);
    setState(() {
      currFrase = frases[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Frases do Dia!'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Image(image: AssetImage("assets/images/logo.png")),
              Text(currFrase),
              ElevatedButton(
                  onPressed: _changeFrase, child: const Text("Clique")),
            ],
          ),
        ),
      ),
    );
  }
}
