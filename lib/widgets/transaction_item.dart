import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Function deleteTransactionById;

  TransactionItem({
    @required this.id,
    @required this.title,
    @required this.date,
    @required this.amount,
    @required this.deleteTransactionById,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: FittedBox(
              child: Text('\$${amount.toStringAsFixed(2)}'),
            ),
          ),
          radius: 30,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(date),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () => deleteTransactionById(id),
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}
