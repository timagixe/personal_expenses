import 'package:flutter/material.dart';

class ExpensesChartBar extends StatelessWidget {
  final String weekDayLabel;
  final double spentAmountTotal;
  final double percentageOfSpentAmountTotal;

  ExpensesChartBar({
    @required this.percentageOfSpentAmountTotal,
    @required this.spentAmountTotal,
    @required this.weekDayLabel,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double textWidgetHeight =
          constraints.heightConstraints().maxHeight * 0.15;
      final double sizedBoxWidgetHeight =
          constraints.heightConstraints().maxHeight * 0.05;
      final double chartBarHeight =
          constraints.heightConstraints().maxHeight * 0.6;

      return Column(
        children: [
          Container(
            height: textWidgetHeight,
            child: FittedBox(
              child: Text('\$${spentAmountTotal.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: sizedBoxWidgetHeight,
          ),
          Container(
            height: chartBarHeight,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentageOfSpentAmountTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: sizedBoxWidgetHeight,
          ),
          Container(
            height: textWidgetHeight,
            child: FittedBox(
              child: Text(weekDayLabel),
            ),
          )
        ],
      );
    });
  }
}
