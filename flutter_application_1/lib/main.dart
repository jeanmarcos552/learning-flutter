import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(PageHome());
}

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHome();
}

class _PageHome extends State<PageHome> {
  List<String> phases = [
    "A palavra “impossível” foi inventada para ser desafiada.",
    "Somos capazes de fazer muito mais do que imaginamos!"
  ];

  String msgButton = "Bom dia!";
  String? randomLists;
  int lastNumberGenerated = 0;
  Random random = Random();

  String _checkHours() {
    final now = DateTime.now();

    if (now.hour >= 0 && now.hour <= 5) {
      return "Boa Madrugada!";
    }

    if (now.hour >= 6 && now.hour <= 11) {
      return "Bom dia!";
    }

    if (now.hour >= 12 && now.hour <= 18) {
      return "Boa Tarde!";
    }

    return "Boa Noite!";
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      randomLists = phases[0];
    });
  }

  _randomPhrases() {
    var numberGenerated = random.nextInt(2);
    _checkHours();

    if (numberGenerated == lastNumberGenerated) {
      return _randomPhrases();
    }

    setState(() {
      randomLists = phases[numberGenerated];
      lastNumberGenerated = numberGenerated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      home: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/bg_1.png"),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                  ),
                  padding:
                      EdgeInsets.only(top: 50, bottom: 50, left: 10, right: 10),
                  child: Text(
                    randomLists ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      wordSpacing: 1,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: 28,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Dancing",
                    ),
                  ),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    elevation: 1,
                  ),
                  onPressed: _randomPhrases,
                  child: Text(_checkHours()),
                ),
              ],
            ),
          )),
    );
  }
}
