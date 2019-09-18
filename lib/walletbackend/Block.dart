import 'package:json_annotation/json_annotation.dart';
import 'package:securus_wallet/walletbackend/RawCoinbaseTransaction.dart';
import 'package:securus_wallet/walletbackend/RawTransaction.dart';

@JsonSerializable(nullable: false)
class Block {
    final RawCoinbaseTransaction coinbaseTransaction;

    final List<RawTransaction> rawTransactions;

    final int blockHeight;

    final String blockHash;

    final int blockTimestamp;

    Block({this.coinbaseTransaction, this.rawTransactions, this.blockHeight,this.blockHash,this.blockTimestamp});
}