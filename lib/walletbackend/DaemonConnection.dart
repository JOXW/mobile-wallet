import 'package:securus_wallet/walletbackend/DaemonType.dart';

class DaemonConnection {
  final String host;
  final int port;
  final DaemonType daemonType;
  final bool useSSL;

  DaemonConnection({this.host,this.port,this.daemonType,this.useSSL});
}