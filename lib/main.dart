import 'package:flutter/material.dart';

import './widget/result.dart';
import './widget/form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Share',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 17),
          bodyText2: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          subtitle1: TextStyle(fontSize: 16),
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
  double _finalTip = 0.00;
  double _finalTotal = 0.00;
  int _people = 1;

  void _updatePeople(int value) {
    setState(() {
      _people = value;
    });
  }

  void _updateTip(double tip, double total) {
    setState(() {
      _finalTip = tip;
      _finalTotal = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FormWidget(_updatePeople, _updateTip),
            Result(_finalTip, _finalTotal, _people),
          ],
        ),
      ),
    );
  }
}
