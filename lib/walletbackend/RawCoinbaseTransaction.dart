import 'package:json_annotation/json_annotation.dart';
import 'package:securus_wallet/walletbackend/KeyOutput.dart';

@JsonSerializable(nullable: false)
class RawCoinbaseTransaction {
  final List<KeyOutput> keyoutputs;
  final String hash;
  final String transactionPublicKey;
  final int unlockTime;

  RawCoinbaseTransaction({this.keyoutputs,this.hash,this.transactionPublicKey,this.unlockTime});
}