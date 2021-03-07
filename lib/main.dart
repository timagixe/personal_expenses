import 'package:flutter/material.dart';

import './transaction.dart';

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

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      title: 'Shoes',
      amount: 9.99,
      date: DateTime.now(),
    ),
    Transaction(
      title: 'Tulips',
      amount: 17.25,
      date: DateTime.now(),
    ),
    Transaction(
      title: 'Cup',
      amount: 4,
      date: DateTime.now(),
    ),
    Transaction(
      title: 'Pen',
      amount: 0.49,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App Home Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                elevation: 2,
                child: Text('CARD WITH DAYS'),
              ),
            ),
            Container(
              width: double.infinity,
              child: Card(
                elevation: 2,
                child: Text('CARD WITH EXPENSES'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
