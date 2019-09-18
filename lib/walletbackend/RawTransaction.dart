import 'package:json_annotation/json_annotation.dart';
import 'package:securus_wallet/walletbackend/KeyInput.dart';
import 'package:securus_wallet/walletbackend/KeyOutput.dart';
import 'package:securus_wallet/walletbackend/RawCoinbaseTransaction.dart';

@JsonSerializable(nullable: false)
class RawTransaction extends RawCoinbaseTransaction {
  final String paymentId;
  final List<KeyInput> keyInputs;

  RawTransaction(
      List<KeyOutput> keyoutputs,
      String hash,
      String transactionPublicKey,
      int unlockTime,
      this.paymentId,
      this.keyInputs)
      : super(
            keyoutputs: keyoutputs,
            hash: hash,
            transactionPublicKey: transactionPublicKey,
            unlockTime: unlockTime);
}
