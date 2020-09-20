import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double percentageAmt;
  ChartBar(this.label, this.amount, this.percentageAmt);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return Column(
        children: [
          Container(
            height: constrain.maxHeight * 0.15,
            child: FittedBox(
              child: Text('\$${amount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: constrain.maxHeight * 0.05,
          ),
          Container(
            height: constrain.maxHeight * 0.6,
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
            height: constrain.maxHeight * 0.05,
          ),
          Container(height: constrain.maxHeight * 0.15, child: Text(label)),
        ],
      );
    });
  }
}
