import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class KeyOutput {
  final String key;
  final double amount;
  double globalIndex;

  KeyOutput({this.key, this.amount});
}