import 'package:flutter/material.dart';
import './user_transaction.dart';
import './transaction_list.dart';
import '../modules/transactions.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final List<Transaction> _usertransaction = [
    Transaction(id: 't1', title: 'Shoes', amount: 68.00, date: DateTime.now()),
    Transaction(id: 't2', title: 'Food', amount: 60.00, date: DateTime.now()),
  ];
  void _addnewtransaction(String titles, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: titles,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _usertransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UserTransaction(_addnewtransaction),
        TransactionList(_usertransaction),
      ],
    );
  }
}
