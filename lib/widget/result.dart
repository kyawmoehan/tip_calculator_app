import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double tipTotal;
  final double totalAmount;
  final int people;
  Result(this.tipTotal, this.totalAmount, this.people);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    print(people);
    final perPerosn = people >= 2 && totalAmount > 0
        ? Text(
            'per person',
            style: TextStyle(fontSize: 18),
          )
        : Container();

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 15),
        child: SizedBox(
          width: mediaQuery.size.width * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Tip',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  subtitle: perPerosn,
                  trailing: Text(
                    '${tipTotal.toStringAsFixed(2)}',
                  ),
                ),
                ListTile(
                  title: Text(
                    'Total',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  subtitle: perPerosn,
                  trailing: Text(
                    '${totalAmount.toStringAsFixed(2)}',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
