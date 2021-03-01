import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  final Function updatePeople;
  final Function updateTip;
  FormWidget(this.updatePeople, this.updateTip);
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _billController = TextEditingController(text: '0.00');

  final _tipController = TextEditingController(text: '15');

  final _peopleController = TextEditingController(text: '1');

  void _increaseOne(controller, from) {
    int currentValue = int.parse(controller.text);

    setState(() {
      currentValue++;
      if (from == 'people') {
        widget.updatePeople(currentValue);
      }
      controller.text = currentValue.toString();
      _calculateTip();
    });
  }

  void _decreaseOne(controller, from) {
    int currentValue = int.parse(controller.text);
    if (currentValue == 1) {
      return;
    }

    setState(() {
      currentValue--;
      if (from == 'people') {
        widget.updatePeople(currentValue);
      }
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
    widget.updateTip(totalTip / people, totalAmount);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        SizedBox(
          width: mediaQuery.size.width * 0.7,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            child: Text(
              'Bill',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        SizedBox(
          width: mediaQuery.size.width * 0.7,
          child: TextField(
            controller: _billController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: (_) => _calculateTip(),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
        SizedBox(
          width: mediaQuery.size.width * 0.7,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            child: Text(
              'Tip %',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => _decreaseOne(_tipController, 'tip'),
            ),
            SizedBox(
              width: mediaQuery.size.width * 0.7,
              child: TextField(
                controller: _tipController,
                textAlign: TextAlign.center,
                showCursor: true,
                readOnly: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 10.1),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _increaseOne(_tipController, 'tip'),
            ),
          ],
        ),
        SizedBox(
          width: mediaQuery.size.width * 0.7,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            child: Text(
              'Number of people',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => _decreaseOne(_peopleController, 'people'),
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
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _increaseOne(_peopleController, 'people'),
            ),
          ],
        ),
      ],
    );
  }
}
