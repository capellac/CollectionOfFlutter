import 'package:flutter/material.dart';

class PhrasalVerbItem {
  int unit;
  String phrasalVerb;
  String definition;
  List<String> examples;
  String imageUrl;

  PhrasalVerbItem({
    @required this.unit,
    @required this.phrasalVerb,
    @required this.definition,
    @required this.examples,
    @required this.imageUrl,
  });
}

class PhrasalVerbsProvider with ChangeNotifier {
  final _items = [
    PhrasalVerbItem(
      unit: 1,
      phrasalVerb: "Find out",
      definition:
          '​to get some information about something/somebody by asking, reading, etc.',
      examples: ["He found out which platform the train left from"],
      imageUrl: 'assets/images/find_out.png',
    ), 
    PhrasalVerbItem(
      unit: 1,
      phrasalVerb: "Look for",
      definition:
          '​to try to find (something or someone), often a thing or person that is lost.',
      examples: ["He found out which platform the train left from"],
      imageUrl: 'assets/images/look_for.gif',
    ), 
    PhrasalVerbItem(
      unit: 1,
      phrasalVerb: "Look up",
      definition:
          'to find (or try to find) something (e.g. a telephone number) in a book (e.g. a telephone directory).',
      examples: ["He found out which platform the train left from"],
      imageUrl: 'assets/images/look_up.jpg',
    ), 
    PhrasalVerbItem(
      unit: 1,
      phrasalVerb: "Look over",
      definition:
          'to examine (someone or something) carefully and fully.',
      examples: ["He found out which platform the train left from"],
      imageUrl: 'assets/images/look_over.jpg',
    ), 
    PhrasalVerbItem(
      unit: 1,
      phrasalVerb: "Look round",
      definition:
          'to visit and tour round a place.',
      examples: ["He found out which platform the train left from"],
      imageUrl: 'assets/images/look_round.jpg',
    ), 
    PhrasalVerbItem(
      unit: 1,
      phrasalVerb: "Look into",
      definition:
          'to investigate; to carefully examine a situation or event and try to discover the reasons for it.',
      examples: ["He found out which platform the train left from"],
      imageUrl: 'assets/images/look_into.png',
    ), 
  ];

  int get getLength {
    return _items.length;
  }

  List<PhrasalVerbItem> get getItems {
    return [..._items];
  }

  List<PhrasalVerbItem> getWithUnitNumber(int unitNumber)
  {
    return _items.where((item) => item.unit == unitNumber).toList();
  }

}
