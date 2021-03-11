import 'package:flutter/material.dart';

// THIS IMPORT IS REQUIRED FOR WidgetsFlutterBinding AND SystemChrome
// import 'package:flutter/services.dart';

import 'models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/expenses_chart.dart';

void main() {
  // UNCOMMENT THIS TO FORBID LANDSCAPE ORIENTATIONS
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenses App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.lightGreen,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              button: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              subtitle1: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              headline2: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      amount: 25,
      date: DateTime.now().subtract(Duration(days: 2)),
      title: 'Lol',
    ),
    Transaction(
      amount: 5,
      date: DateTime.now().subtract(Duration(days: 4)),
      title: 'Lol',
    ),
    Transaction(
      amount: 15,
      date: DateTime.now(),
      title: 'Lol',
    ),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where((transaction) => transaction.date
            .isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: date,
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  void _deleteTransactionById(String id) {
    setState(() {
      _userTransactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  void _openAddNewTransactionModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builderContext) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final AppBar appBar = AppBar(
      title: Text('Expenses App'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openAddNewTransactionModal(context),
        )
      ],
    );

    final double expensesChartHeightInPortrait =
        (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.3;

    final double expensesChartHeightInLandscape =
        (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.7;

    final double transactionsListHeight = (MediaQuery.of(context).size.height -
            appBar.preferredSize.height -
            MediaQuery.of(context).padding.top) *
        0.7;

    final Widget transactionListContainer = Container(
      height: transactionsListHeight,
      child: TransactionList(
        transactions: _userTransactions,
        deleteTransactionById: _deleteTransactionById,
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          if (isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show chart'),
                Switch(
                  value: _showChart,
                  onChanged: (newValue) {
                    setState(() {
                      _showChart = newValue;
                    });
                  },
                )
              ],
            ),
          if (isLandscape)
            _showChart
                ? Container(
                    height: expensesChartHeightInLandscape,
                    width: double.infinity,
                    child: ExpensesChart(_recentTransactions),
                  )
                : transactionListContainer,
          if (!isLandscape)
            Container(
              height: expensesChartHeightInPortrait,
              width: double.infinity,
              child: ExpensesChart(_recentTransactions),
            ),
          if (!isLandscape) transactionListContainer
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: !isLandscape,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _openAddNewTransactionModal(context),
        ),
      ),
    );
  }
}
