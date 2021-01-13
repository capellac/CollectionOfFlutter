import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/phrasal_verbs_provider.dart';
import '../widgets/each_unit_items.dart';

class EachUnitScreen extends StatelessWidget {
  static const screenName = '/unit-screen';

  @override
  Widget build(BuildContext context) {
    var prod = Provider.of<PhrasalVerbsProvider>(context, listen: false);
    final unitNumber = ModalRoute.of(context).settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Unit $unitNumber',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) => EachUnitItems(prod.getWithUnitNumber(unitNumber)[index]),
        itemCount: prod.getWithUnitNumber(unitNumber).length,
      ),
    );
  }
}
