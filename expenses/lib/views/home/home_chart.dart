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
  final daysWeeksTranslate = {
    "Sat": "Sáb",
    "Fri": "Sex",
    "Thu": "Qui",
    "Wed": "Qua",
    "Tue": "Ter",
    "Mon": "Seg",
    "Sun": "Dom"
  };

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

      return {"day": DateFormat.E().format(weekday), 'value': totalSum};
    }).reversed.toList();
  }

  double get weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, element) {
      return sum + (element["value"] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple[300],
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupedTransactions
              .map(
                (tr) => Column(
                  children: [
                    Text(
                      tr["value"].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 60,
                      width: 10,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              color: const Color.fromRGBO(220, 220, 220, 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          FractionallySizedBox(
                            heightFactor:
                                (tr['value'] as double) / weekTotalValue,
                            child: Container(
                                decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(5),
                            )),
                          )
                        ],
                      ),
                    ),
                    Text(
                      daysWeeksTranslate[tr["day"]].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
