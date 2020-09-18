import '../modules/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> resentTransactions;
  Chart(this.resentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDays = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < resentTransactions.length; i++) {
        if (resentTransactions[i].date.day == weekDays.day &&
            resentTransactions[i].date.month == weekDays.month &&
            resentTransactions[i].date.year == weekDays.year) {
          totalSum += resentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDays).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: groupedTransactions.map((data) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                      data['day'],
                      data['amount'],
                      maxSpending == 0
                          ? 0.00
                          : (data['amount'] as double) / maxSpending),
                );
              }).toList()),
        ),
      ),
    );
  }
}
