import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  final Function addtx;

  UserTransaction(this.addtx);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final _textcontroller = TextEditingController();

  final _amountcontroller = TextEditingController();

  void submitData() {
    final entereddata = _textcontroller.text;
    final enteramount = double.parse(_amountcontroller.text);

    if (enteramount <= 0 || entereddata.isEmpty) {
      return;
    }
    widget.addtx(
      entereddata,
      enteramount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _textcontroller,
            onSubmitted: (_) => submitData,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: _amountcontroller,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData,
          ),
          FlatButton(
            child: Text(
              'Add Transactions',
              style: TextStyle(color: Colors.purple),
            ),
            onPressed: submitData,
          )
        ],
      ),
    );
  }
}
