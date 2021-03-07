import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App Home Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                elevation: 2,
                child: Text('CARD WITH DAYS'),
              ),
            ),
            Container(
              width: double.infinity,
              child: Card(
                elevation: 2,
                child: Text('CARD WITH EXPENSES'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
