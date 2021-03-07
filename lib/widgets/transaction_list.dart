import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
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
                            Text(DateFormat.yMMMd().format(transaction.date),
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
      ),
    );
  }
}