import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class KeyInput {
  final double amount;
  final String keyImage;
  final List<double> outputIndexes;

  KeyInput({this.amount,this.keyImage,this.outputIndexes});
}