class Config {
  final int decimalPlaces = 2;
  final int adressPrefix = 3914525;
  final int requestTimeout = 10 * 1000;
  final int blockTargetTime = 30;
  final int syncThreadInterval = 10;
  final int daemonUpdateInterval = 10 * 1000;
  final int lockedTransactionsCheckInterval = 30 * 1000;
  final int blockPerTick = 1;
  final String ticker = "SCR";
  final bool scanCoinbaseTransactions = false;
  final double minimumFee = 10;
  final double standardAdressLength = 99 + ((64 * 11) / 8);

  String underivePublicKey(String derivation, double outputIndex, String outputKey) {
    //C++ wallet backend bindings
    return "";
  }

  String derivePublicKey(String derivation, double outputIndex, String outputKey) {
    //C++ wallet backend bindings
    return "";
  }

  String deriveSecretKey(String derivation, double outputIndex, String privateKey) {
    //C++ wallet backend bindings
    return "";
  }

  String generateKeyImage(String publicKey, String privateKey) {
    //C++ wallet backend bindings
    return "";
  }

  String secretKeyToPublicKey(String privateKey) {
    //C++ wallet backend bindings
    return "";
  }

  String cnFastHash(String input) {
    //C++ wallet backend bindings
    return "";
  }

  List<String> generateRingSignatures(String transactionPrefix, String keyImage, List<String> inputKeys, String privateKey, int realIndex) {
    //C++ wallet backend bindings
    return [];
  }

  String generateKeyDerivation(String transactionPublicKey, String privateViewKey) 
  {
    //C++ wallet backend bindings
    return "";
  }

  final int blockStoreMemoryLimit = 1024 * 1024 * 50;

  final int blocksPerDaemonRequest = 100;

  final int maxLastFetchedBlockInterval = 60 * 3;
  final int maxLastUpdatedNetworkHeightInterval = 60 * 3;
  final int maxLastUpdatedLocalHeightInterval = 60 * 3;
}