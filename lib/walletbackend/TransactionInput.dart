import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class TransactionInput {
  final String keyImage;
  final double amount;
  final int blockHeight;
  final String transactionPublicKey;
  final int transactionIndex;
  final int globalOutputIndex;
  //The transaction key we took from the key outputs. NOT the same as the transaction public key.
  final String key;
  final double spendHeight;
  final int unlockTime;
  final String parentTransactionHash;

  TransactionInput({this.keyImage,this.amount,this.blockHeight,this.transactionPublicKey,this.transactionIndex,this.globalOutputIndex,this.key,this.spendHeight, this.unlockTime,this.parentTransactionHash});
}