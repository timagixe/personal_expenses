import 'package:flutter/material.dart';

import 'models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  void _openAddNewTransactionModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builderContext) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openAddNewTransactionModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 2,
                  child: Text('CARD WITH DAYS'),
                ),
              ),
              TransactionList(_userTransactions),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openAddNewTransactionModal(context),
      ),
    );
  }
}
