import './widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './modules/transactions.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dem',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.grey,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _usertransaction = [
    // Transaction(id: 't1', title: 'Shoes', amount: 68.00, date: DateTime.now()),
    // Transaction(id: 't2', title: 'Food', amount: 60.00, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransaction {
    return _usertransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

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

  void _adduserTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          child: UserTransaction(_addnewtransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _adduserTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransaction),
            TransactionList(_usertransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _adduserTransaction(context),
      ),
    );
  }
}
