import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../providers/phrasal_verbs_provider.dart';
import '../screens/each_phrasal_verb_screen.dart';

class EachUnitItems extends StatelessWidget {
  final PhrasalVerbItem singleItem;

  EachUnitItems(this.singleItem);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
            EachPhrasalVerbScreen.screenName, arguments: singleItem,
          ),
          child: GridTile(
            footer: Text(
              singleItem.phrasalVerb,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            child: Image.asset(
              singleItem.imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ));
  }
}
