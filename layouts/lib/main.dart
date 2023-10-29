import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ola",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue[50],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            "ola",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45,
                            ),
                          ),
                          Text("ola"),
                        ],
                      ),
                      CircleAvatar(
                        radius: 28,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                          // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      border: Border.all(
                        width: 0,
                        color: Colors.white,
                      ),
                    ),
                    child: TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintText: "Pesquisar alunos",
                        contentPadding: EdgeInsets.only(
                            left: 20, right: 20, top: 15, bottom: 15),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 10, left: 5),
                          child: CircleAvatar(
                            child: Icon(Icons.search),
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print(_textEditingController.text);
                  },
                  child: const Text("Enviar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
