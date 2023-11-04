import 'package:expenses/components/card_app.dart';
import 'package:flutter/material.dart';

class HomeChart extends StatefulWidget {
  const HomeChart({super.key});

  @override
  State<StatefulWidget> createState() => _HomeChart();
}

class _HomeChart extends State<HomeChart> {
  // This widget is the root of your application.
  final Map<int, String> dayOfWeek = {
    1: "Dom",
    2: "Seg",
    3: "Ter",
    4: "Qua",
    5: "Quin",
    6: "Sext",
    7: "Sáb",
  };

  @override
  Widget build(BuildContext context) {
    return CardApp(
      color: Colors.purple[400],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var i = 1; i <= 7; i++)
            Column(
              children: <Widget>[
                const Text(
                  "ola",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  dayOfWeek[i].toString(),
                  style: TextStyle(
                    color: Colors.grey[100],
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
