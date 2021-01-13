import 'package:flutter/material.dart';

import '../screens/each_unit_screen.dart';

class HomeUnitsItems extends StatelessWidget {
  final int unitNumber;

  HomeUnitsItems({
    @required this.unitNumber,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(EachUnitScreen.screenName, arguments: unitNumber + 1),
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(10),
        child: Container(
          height: size.height / 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Unit ${unitNumber + 1}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text('Completed'),
                    Checkbox(
                      value: false,
                      onChanged: null,
                      checkColor: Colors.orange,
                    )
                  ],
                ),
              ),
              //TODO: Add phrasal verbs in this unit
            ],
          ),
        ),
      ),
    );
  }
}
