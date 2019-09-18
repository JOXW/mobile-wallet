import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securus_wallet/TransactionsProvider.dart';

class TransactionsPage extends StatefulWidget {
  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionsProvider>(
        builder: (context, model, child) => Container(
              color: Colors.amberAccent,
            ));
  }
}
