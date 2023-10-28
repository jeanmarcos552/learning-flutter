import 'dart:math';

import 'package:flutter/material.dart';

class HomeGame extends StatefulWidget {
  const HomeGame({super.key});

  @override
  State<HomeGame> createState() => _HomeGameState();
}

class _HomeGameState extends State<HomeGame> {
  var result = "";
  JokenPo jokenpo = JokenPo();

  void _chooseOption(String option) {
    setState(() {
      result = jokenpo.play(option);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  "Escolha da máquina",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                ),
              ),
              Image(
                image: AssetImage("assets/images/${jokenpo.imagem}"),
                width: 100,
                height: 100,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              for (String item in jokenpo._options)
                Flexible(
                  child: GestureDetector(
                    onTap: () => _chooseOption(item),
                    child: CircleAvatar(
                      backgroundColor: jokenpo._play1 == item
                          ? Colors.green
                          : Colors.white,
                      radius: 100,
                      child:  Image(
                        image: AssetImage("assets/images/$item.png"),
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Flexible(
            child: Text(
              result,
              style: const TextStyle(color: Colors.black, fontSize: 28),
            ),
          ),
        ],
      ),
    );
  }
}

class JokenPo {
  final _options = ["pedra", "papel", "tesoura"];
  String _play1 = "";
  String _play2 = "";
  String _imageMachine = "padrao.png";

  get imagem => _imageMachine;

  String play(String play1) {
    _play1 = play1;
    _play2 = _options[Random().nextInt(3)];
    _imageMachine = "$_play2.png";

    if (play1 == _play2) {
      return "Empate";
    }

    if (play1 == "pedra" && _play2 == "tesoura") {
      return "Você Ganhou!";
    }

    if (play1 == "papel" && _play2 == "pedra") {
      return "Você Ganhou!";
    }

    if (play1 == "tesoura" && _play2 == "papel") {
      return "Você Ganhou!";
    }

    return "Você perdeu!";
  }
}
