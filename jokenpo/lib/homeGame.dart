import 'dart:math';

import 'package:flutter/material.dart';

class HomeGame extends StatefulWidget {
  const HomeGame({super.key});

  @override
  State<HomeGame> createState() => _HomeGameState();
}

class _HomeGameState extends State<HomeGame> {
  var machine = "";
  var result = "";

  void chooseOption(String option) {
    var options = ["pedra", "papel", "tesoura"];

    setState(() {
      machine = options[Random().nextInt(3)];
      result = JokenPo().play(option, machine);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text(
            "Faça sua aposta!",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: GestureDetector(
                  onTap: () => chooseOption("pedra"),
                  child:  CircleAvatar(
                    backgroundColor: machine == "pedra" ? Colors.green : Colors.white,
                    radius: 90,
                    child: const Image(
                      image: AssetImage("assets/images/pedra.png"),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () => chooseOption("papel"),
                  child:  CircleAvatar(
                    backgroundColor: machine == "papel" ? Colors.green : Colors.white,
                    radius: 90,
                    child: const Image(
                      image: AssetImage("assets/images/papel.png"),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () => chooseOption("tesoura"),
                  child:  CircleAvatar(
                    backgroundColor: machine == "tesoura" ? Colors.green : Colors.white,
                    radius: 90,
                    child: const Image(
                      image: AssetImage("assets/images/tesoura.png"),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Jogada da maquina: ",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "$machine ",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Text(
              "Resultado: $result ",
              style: const TextStyle(color: Colors.black, fontSize: 28),
            ),
          ),
        ],
      ),
    );
  }
}

class JokenPo {
  String play(String play1, String machine) {
    if (play1 == machine) {
      return "Empate";
    }

    if (play1 == "pedra" && machine == "tesoura") {
      return "Você Ganhou!";
    }

    if (play1 == "papel" && machine == "pedra") {
      return "Você Ganhou!";
    }

    if (play1 == "tesoura" && machine == "papel") {
      return "Você Ganhou!";
    }

    return "Você perdeu!";
  }
}
