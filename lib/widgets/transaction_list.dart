import 'package:flutter/material.dart';
import '../modules/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transaction.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/holding-phone.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'No Transactions Added Yet!',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.blueAccent, width: 2)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${transaction[index].amount.toStringAsPrecision(2)}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat.yMMMd().format(transaction[index].date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
