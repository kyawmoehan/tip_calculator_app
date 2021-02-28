import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double finalTip;
  double finalTotal;
  final _billController = TextEditingController(text: '0.00');
  final _tipController = TextEditingController(text: '15');
  final _peopleController = TextEditingController(text: '1');

  void _increaseOne(controller) {
    int currentValue = int.parse(controller.text);
    setState(() {
      currentValue++;
      controller.text = currentValue.toString();
      _calculateTip();
    });
  }

  void _decreaseOne(controller) {
    int currentValue = int.parse(controller.text);
    setState(() {
      currentValue--;
      controller.text = currentValue.toString();
      _calculateTip();
    });
  }

  void _calculateTip() {
    double bill = double.parse(_billController.text);
    int tip = int.parse(_tipController.text);
    int people = int.parse(_peopleController.text);
    double totalTip = (bill * (tip / 100));
    double totalAmount = (bill + totalTip) / people;
    setState(() {
      finalTip = (totalTip / people);
      finalTotal = totalAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    _calculateTip();
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: Text('Bill'),
            ),
            SizedBox(
              width: mediaQuery.size.width * 0.7,
              child: TextField(
                controller: _billController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (_) => _calculateTip(),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: Text('Tip %'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => _decreaseOne(_tipController),
                ),
                SizedBox(
                  width: mediaQuery.size.width * 0.7,
                  child: TextField(
                    controller: _tipController,
                    textAlign: TextAlign.center,
                    showCursor: true,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _increaseOne(_tipController),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: Text('Number of people'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => _decreaseOne(_peopleController),
                ),
                SizedBox(
                  width: mediaQuery.size.width * 0.7,
                  child: TextField(
                    onChanged: (_) => _calculateTip,
                    controller: _peopleController,
                    showCursor: true,
                    readOnly: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _increaseOne(_peopleController),
                ),
              ],
            ),
            Text('Tip${finalTip.toStringAsFixed(2)}'),
            Text('Total${finalTotal.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
