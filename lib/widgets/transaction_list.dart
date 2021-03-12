import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';
import './transaction_list_empty_.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransactionById;

  TransactionList({this.transactions, this.deleteTransactionById});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? TransactionListEmpty()
          : ListView.builder(
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) {
                    deleteTransactionById(transactions[index].id);
                  },
                  child: TransactionItem(
                    id: transactions[index].id,
                    title: transactions[index].title,
                    amount: transactions[index].amount,
                    date: transactions[index].date,
                    deleteTransactionById: deleteTransactionById,
                  ),
                  background: Container(
                    color: Colors.red,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.delete_forever,
                      color: Colors.white,
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
