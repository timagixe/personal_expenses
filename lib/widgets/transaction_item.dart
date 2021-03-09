import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;

  TransactionItem({
    @required this.title,
    @required this.date,
    @required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            child: Text(
              '\$${amount.toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                DateFormat.yMMMd().format(date),
                // style: Theme.of(context).textTheme.headline2,
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          )
        ],
      ),
    );
  }
}
