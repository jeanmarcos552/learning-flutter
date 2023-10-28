import 'package:flutter/material.dart';

class Layouts extends StatelessWidget {
  const Layouts({super.key});

  @override
  Widget build(BuildContext context) {
    final listText = [
      "Widgets são usados para elementos de layout e UI.",
      "Componha widgets simples para construir widgets complexos.",
      "Widgets são classes usadas para construir UIs."
    ].join('\n');

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.white24,
        foregroundColor: Colors.white,
        title: const Text(
          'Layouts',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.normal),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: Column(
          children: <Widget>[
            const Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Layouts in Flutter",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans',
                          color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    listText,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'OpenSans'),
                  ),
                )),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white30,
                          blurRadius: 10,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Accessibility",
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: "OpenSans",
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Crie apps com acessibilidade!",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "OpenSans",
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white30,
                          blurRadius: 10,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Accessibility",
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: "OpenSans",
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Crie apps com acessibilidade!",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "OpenSans",
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white30,
                          blurRadius: 10,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Accessibility",
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: "OpenSans",
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Crie apps com acessibilidade!",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "OpenSans",
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white30,
                          blurRadius: 10,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Accessibility",
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: "OpenSans",
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Crie apps com acessibilidade!",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "OpenSans",
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      )),
    );
  }
}
