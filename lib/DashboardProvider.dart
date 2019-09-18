import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:securus_wallet/data/Transaction.dart';
import 'package:securus_wallet/data/TransactionStatus.dart';
import 'package:securus_wallet/data/TransactionType.dart';

class DashboardProvider extends ChangeNotifier {
  List<Transaction> _transactions = [];
  List<Transaction> _allTransactions = [];
  List<Transaction> get transactions => _transactions;

  DashboardProvider() {
    initTransactions();
  }

  void initTransactions() {
    var rng = Random();
    for (int i = 0; i < 20; i++) {
      var amount = rng.nextDouble() * 100;
      _transactions.add(Transaction(
          amount: amount,
          fee: amount / 10,
          recipientAdress: rng.nextInt(9999999).toString(),
          senderAddress: rng.nextInt(9999999).toString(),
          transactionDate:
              DateTime.now().subtract(Duration(days: rng.nextInt(1000))),
          transactionId: rng.nextInt(9999999).toString(),
          transactionStatus: TransactionStatus.values[rng.nextInt(3)],
          transactionType: TransactionType.values[rng.nextInt(2)]));
    }
    _allTransactions = transactions;
    notifyListeners();
  }

  void filterTransactionList(FilterTransactionType type) {
    switch (type) {
      case FilterTransactionType.SENT:
        _transactions = _allTransactions
            .where((tran) => tran.transactionType == TransactionType.SENT).toList();
        break;
      case FilterTransactionType.RECEIVED:
        _transactions = _allTransactions
            .where((tran) => tran.transactionType == TransactionType.RECEIVED).toList();
        break;
      default:
        _transactions = _allTransactions;
    }
    notifyListeners();
  }
}

enum FilterTransactionType { SENT, RECEIVED, ALL }
