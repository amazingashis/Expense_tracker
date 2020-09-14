import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double percentageAmt;
  ChartBar(this.label, this.amount, this.percentageAmt);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text('\$${amount.toStringAsFixed(0)}'),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          height: 80,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(220, 220, 220, 1),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentageAmt,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(label),
      ],
    );
  }
}
