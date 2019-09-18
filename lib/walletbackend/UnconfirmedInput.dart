import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class UnconfirmedInput {
  final double amount;
  final String key;
  final String parentTransactionHash;

  UnconfirmedInput({this.amount,this.key,this.parentTransactionHash});
}