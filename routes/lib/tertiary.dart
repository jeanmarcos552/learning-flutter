import 'package:flutter/material.dart';
import 'package:routes/main.dart';

class TertiaryRoute extends StatelessWidget {
  const TertiaryRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonBack = Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Back"),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()))
                  },
                  child: const Text("Second"),
                ),
              ),
            ],
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tertiary Route'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 25)],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[300],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FirstRoute()));
                  },
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Home!"),
                    ),
                  ),
                ),
              ),
              buttonBack,
            ],
          ),
        ),
      ),
    );
  }
}
