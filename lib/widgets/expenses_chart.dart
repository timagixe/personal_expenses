import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class ExpensesChart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  ExpensesChart(this.recentTransactions);

  List<Map<String, Object>> get getGrouppedTransactions {
    return List.generate(7, (index) {
      final DateTime weekDay = DateTime.now().subtract(Duration(days: index));
      final String weekDayShortcut = DateFormat.E().format(weekDay);

      var totalAmount = 0.0;

      for (final transaction in recentTransactions) {
        final double transactionAmount = transaction.amount;
        final DateTime transactionDate = transaction.date;
        final bool isThisTransactionWeLookFor =
            transactionDate.day == weekDay.day &&
                transactionDate.month == weekDay.month &&
                transactionDate.year == weekDay.year;

        if (isThisTransactionWeLookFor) {
          totalAmount += transactionAmount;
        }
      }

      return {
        'day': weekDayShortcut,
        'amount': totalAmount,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Row(),
    );
  }
}
