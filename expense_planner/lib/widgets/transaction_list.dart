import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.length == 0
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text('No Transactions Added Yet!'),
                  const SizedBox(height: 10),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    width: constraints.maxWidth * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(children: <Widget>[
            ...(transactions as List).map((item) {
              return TransactionItem(
                ValueKey(item
                    .id), //One key that may use UniqueKey() (is a class built in flutter)
                item,
                _deleteTransaction,
              );
            }).toList()
          ]);
  }
}
