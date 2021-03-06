import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/widgets/expenses_chart_bar.dart';

import '../models/transaction.dart';

class ExpensesChart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  ExpensesChart(this.recentTransactions);

  List<Map<String, Object>> get grouppedTransactions {
    return List.generate(7, (index) {
      final DateTime weekDay = DateTime.now().subtract(Duration(days: index));
      final String weekDayShortcut =
          DateFormat.E().format(weekDay).substring(0, 1);

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
    }).reversed.toList();
  }

  double get totalSpending {
    return grouppedTransactions.fold(
        0.0, (previousValue, element) => previousValue += element['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: grouppedTransactions
              .map((value) => Flexible(
                    fit: FlexFit.tight,
                    child: ExpensesChartBar(
                      weekDayLabel: value['day'],
                      spentAmountTotal: value['amount'],
                      percentageOfSpentAmountTotal: totalSpending != 0.0
                          ? (value['amount'] as double) / totalSpending
                          : totalSpending,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
