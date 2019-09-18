import 'package:securus_wallet/data/TransactionStatus.dart';
import 'package:securus_wallet/data/TransactionType.dart';

class Transaction {
  String transactionId;
  String senderAddress;
  String recipientAdress;
  double amount;
  double fee;
  DateTime transactionDate;
  TransactionStatus transactionStatus;
  TransactionType transactionType;

  Transaction(
      {this.transactionId,
      this.senderAddress,
      this.recipientAdress,
      this.amount,
      this.fee,
      this.transactionDate,
      this.transactionStatus,
      this.transactionType});
}
