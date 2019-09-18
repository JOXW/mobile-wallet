import 'package:securus_wallet/walletbackend/Transaction.dart';
import 'package:securus_wallet/walletbackend/TransactionInput.dart';

class TransactionData {
  List<Transaction> transactionsToAdd = [];
  Map<String, TransactionInput> inputsToAdd = {};
  Map<String,String> keyImagesToMarkSpent = {};
}