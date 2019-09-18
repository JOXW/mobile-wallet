import 'package:securus_wallet/walletbackend/TransactionInput.dart';

class TxInputAndOwner {
  final TransactionInput input;
  final String privateSeedKey;
  final String publicSpendKey;

  TxInputAndOwner({this.input,this.privateSeedKey,this.publicSpendKey});
}