import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securus_wallet/BottomNavigationBarProvider.dart';
import 'package:securus_wallet/ContactsPage.dart';
import 'package:securus_wallet/DashboardPage.dart';
import 'package:securus_wallet/DashboardProvider.dart';
import 'package:securus_wallet/SettingsPage.dart';
import 'package:securus_wallet/TransactionsPage.dart';
import 'package:securus_wallet/TransactionsProvider.dart';
import 'package:securus_wallet/widget/navigationbar/CurvedNavigationBar.dart';
import 'package:securus_wallet/widget/navigationbar/CurvedNavigationBarItem.dart';

class SecurusNavigationBar extends StatefulWidget {
  SecurusNavigationBar({Key key}) : super(key: key);
  @override
  _SecurusNavigationBarState createState() => _SecurusNavigationBarState();
}

class _SecurusNavigationBarState extends State<SecurusNavigationBar> {
  final currentTab = [
    ChangeNotifierProvider<DashboardProvider>(
      child: DashboardPage(),
      builder: (BuildContext context) => DashboardProvider(),
    ),
    ChangeNotifierProvider<TransactionsProvider>(
      child: TransactionsPage(),
      builder: (BuildContext context) => TransactionsProvider(),
    ),
    ContactsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Theme.of(context).bottomAppBarColor,
        height: 50,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          provider.currentIndex = index;
        },
        items: [
          CurvedNavigationBarItem(
            icon: Icon(EvaIcons.gridOutline),
            color: Theme.of(context).backgroundColor,
          ),
          CurvedNavigationBarItem(
            icon: Icon(EvaIcons.creditCardOutline),
            color: Colors.amberAccent,
          ),
          CurvedNavigationBarItem(
            icon: Icon(EvaIcons.peopleOutline),
            color: Colors.redAccent,
          ),
          CurvedNavigationBarItem(
            icon: Icon(EvaIcons.settingsOutline),
            color: Theme.of(context).backgroundColor,
          ),
        ],
      ),
    );
  }
}