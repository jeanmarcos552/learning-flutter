import 'package:expenses/components/card_app.dart';
import 'package:expenses/providers/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeChart extends StatefulWidget {
  const HomeChart({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _HomeChart();
}

class _HomeChart extends State<HomeChart> {
  List<Map<String, Object>> get groupedTransactions {
    final Transactions transactions = Provider.of(context);

    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;

      for (var element in transactions.all) {
        bool sameDay = element.date.day == weekday.day;
        bool sameMonth = element.date.month == weekday.month;
        bool sameYear = element.date.year == weekday.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += element.value;
        }
      }

      return {"day": DateFormat.E().format(weekday)[0], 'value': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return CardApp(
      color: Colors.purple[400],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var item in groupedTransactions)
            Column(
              children: <Widget>[
                Text(
                  item["day"].toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  item["value"].toString(),
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
