import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          children: [
            Container(
              width: double.infinity,
              child: Card(
                elevation: 2,
                child: Text('CARD WITH DAYS'),
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: transactions
                    .map((transaction) => Card(
                          child: Row(
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  minWidth: 100,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 15,
                                ),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.purple,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  '\$${transaction.amount.toString()}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    transaction.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                      DateFormat.yMMMd()
                                          .format(transaction.date),
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
