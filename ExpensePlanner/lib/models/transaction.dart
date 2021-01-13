import 'package:flutter/foundation.dart';

class Transaction {
  //All properties are run-time constant
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({     //Constructor-named arguments
    @required this.id,
    @required this.amount,
    @required this.date,
    @required this.title,
  });
}
