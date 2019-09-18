import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securus_wallet/DashboardProvider.dart';
import 'package:securus_wallet/widget/SynchronisingProvider.dart';
import 'package:securus_wallet/widget/SynchronisingWidget.dart';
import 'package:securus_wallet/widget/TransactionsWidget.dart';
import 'package:securus_wallet/widget/WalletCardWidget.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, child) => Material(
          child: Scaffold(
              body: SafeArea(
        child: Column(
          children: <Widget>[
            WalletCardWidget(dashboardProvider: provider,),
            _transactionTypePicker(provider),
            Expanded(
              child: ListView.builder(
                itemCount: provider.transactions.length,
                itemBuilder: (context, index) {
                  return TransactionWidget(
                      transaction: provider.transactions[index]);
                },
              ),
            ),
            ChangeNotifierProvider<SynchronisingProvider>(
              child: SynchronisingWidget(),
              builder: (BuildContext context) => SynchronisingProvider(),
            ),
          ],
        ),
      ))),
    );
  }

  Widget _transactionTypePicker(DashboardProvider provider) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 16.0, bottom: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
            padding: EdgeInsets.only(
                left: 40.0, right: 40.0, top: 14.0, bottom: 14.0),
            child: Text(
              "SENT",
              style: TextStyle(color: Colors.blue, fontSize: 12.0),
            ),
            color: Theme.of(context).buttonColor,
            onPressed: () {
              provider.filterTransactionList(FilterTransactionType.SENT);
            },
          ),
          RaisedButton(
              padding: EdgeInsets.only(
                  left: 40.0, right: 40.0, top: 14.0, bottom: 14.0),
              child: Text(
                "RECEIVED",
                style: TextStyle(color: Colors.green, fontSize: 12.0),
              ),
              color: Theme.of(context).buttonColor,
              onPressed: () {
                provider.filterTransactionList(FilterTransactionType.RECEIVED);
              }),
          RaisedButton(
              padding: EdgeInsets.only(
                  left: 40.0, right: 40.0, top: 14.0, bottom: 14.0),
              child: Text(
                "ALL",
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              color: Theme.of(context).buttonColor,
              onPressed: () {
                provider.filterTransactionList(FilterTransactionType.ALL);
              }),
        ],
      ),
    );
  }
}
