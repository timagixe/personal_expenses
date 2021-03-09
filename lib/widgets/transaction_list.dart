import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';
import './transaction_list_empty_.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? TransactionListEmpty()
          : ListView.builder(
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
