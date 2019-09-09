import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securus_wallet/BottomNavigationBarProvider.dart';
import 'package:securus_wallet/ContactsPage.dart';
import 'package:securus_wallet/DashboardPage.dart';
import 'package:securus_wallet/SettingsPage.dart';
import 'package:securus_wallet/TransactionsPage.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(SecuruscoinWallet());

class SecuruscoinWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Securuscoin Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<BottomNavigationBarProvider>(
        child: SecuruNavigationBar(),
        builder: (BuildContext context) => BottomNavigationBarProvider(),
      ),
    );
  }
}

class SecuruNavigationBar extends StatefulWidget {
  SecuruNavigationBar({Key key}) : super(key: key);
  @override
  _SecuruNavigationBarState createState() => _SecuruNavigationBarState();
}

class _SecuruNavigationBarState extends State<SecuruNavigationBar> {
  final currentTab = [
    DashboardPage(),
    TransactionsPage(),
    ContactsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.tachometerAlt,color: Colors.blueGrey,),
            title: new Text('Dashboard', style: TextStyle(color: Colors.blueGrey),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.creditCard,color: Colors.blueGrey,),
            title: new Text('Transactions', style: TextStyle(color: Colors.blueGrey),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.addressBook,color: Colors.blueGrey,),
            title: new Text('Contacts', style: TextStyle(color: Colors.blueGrey),),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.cog,color: Colors.blueGrey,),
            title: Text('Settings', style: TextStyle(color: Colors.blueGrey),),
          )
        ],
      ),
    );
  }
}
