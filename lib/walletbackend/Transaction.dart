import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class Transaction {
  final Map<String,double> transfers;
  final String hash;
  final double fee;
  final int blockHeight;
  final int timestamp;
  final String paymentId;
  final int unlockTime;
  final bool isCoinbaseTransaction;

  Transaction({this.transfers,this.hash,this.fee,this.blockHeight,this.timestamp,this.paymentId,this.unlockTime,this.isCoinbaseTransaction});

  double getTotalAmount() {
    double sum = 0;
    transfers.forEach((k, v) => sum+= v);
    return sum;
  }

  bool isFusionTransaction() {
    return this.fee == 0 && !this.isCoinbaseTransaction;
  }
}