import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserTransaction extends StatefulWidget {
  final Function addtx;

  UserTransaction(this.addtx);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final _textcontroller = TextEditingController();

  final _amountcontroller = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountcontroller.text.isEmpty) {
      return;
    }
    final entereddata = _textcontroller.text;
    final enteramount = double.parse(_amountcontroller.text);

    if (enteramount <= 0 || entereddata.isEmpty || _selectedDate == null) {
      return;
    }
    widget.addtx(
      entereddata,
      enteramount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _pickDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
      firstDate: DateTime(2000),
    ).then((datechosen) {
      if (datechosen == null) {
        return;
      }
      setState(() {
        _selectedDate = datechosen;
      });
    });
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
            onSubmitted: (_) => _submitData,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: _amountcontroller,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  _selectedDate == null
                      ? 'No Date Chosen'
                      : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                ),
              ),
              FlatButton(
                onPressed: _pickDate,
                child: Text(
                  'Choose Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                textColor: Theme.of(context).primaryColor,
              )
            ],
          ),
          RaisedButton(
            child: Text(
              'Add Transactions',
            ),
            textColor: Theme.of(context).textTheme.button.color,
            onPressed: _submitData,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
