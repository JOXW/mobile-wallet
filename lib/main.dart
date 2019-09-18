import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securus_wallet/BottomNavigationBarProvider.dart';
import 'package:securus_wallet/ThemeNotifier.dart';
import 'package:securus_wallet/widget/SecurusNavigationBar.dart';

void main() => runApp(
  ChangeNotifierProvider<ThemeNotifier>(
      builder: (BuildContext context) => ThemeNotifier(),
      child: SecuruscoinWallet(),
    ));

class SecuruscoinWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Securuscoin Wallet',
      theme: Provider.of<ThemeNotifier>(context).currentThemeData,
      home: ChangeNotifierProvider<BottomNavigationBarProvider>(
        child: SecurusNavigationBar(),
        builder: (BuildContext context) => BottomNavigationBarProvider(),
      ),
    );
  }
}
