import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return TransactionItem(
            title: transactions[index].title,
            amount: transactions[index].amount,
            date: transactions[index].date,
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
