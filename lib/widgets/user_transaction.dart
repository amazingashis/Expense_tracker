import 'package:flutter/material.dart';

class UserTransaction extends StatelessWidget {
  final Function addtx;
  final _textcontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  UserTransaction(this.addtx);
  void submitData() {
    final entereddata = _textcontroller.text;
    final enteramount = double.parse(_amountcontroller.text);

    if (enteramount <= 0 || entereddata.isEmpty) {
      return;
    }
    addtx(
      entereddata,
      enteramount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.purple,
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
