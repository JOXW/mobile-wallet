import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:securus_wallet/DashboardProvider.dart';

class WalletCardWidget extends StatefulWidget {
  final DashboardProvider dashboardProvider;
  WalletCardWidget({this.dashboardProvider});
  @override
  _WalletCardWidgetState createState() => _WalletCardWidgetState();
}

class _WalletCardWidgetState extends State<WalletCardWidget> {
  final smallTextStyle = const TextStyle(fontSize: 11.0, color: Colors.white);
  final normalTextStyle = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 8.0,
        right: 8.0,
      ),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        color: Colors.blueAccent,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              _walletInformation(widget.dashboardProvider),
              Padding(
                padding: EdgeInsets.only(top: 24.0, bottom: 24.0),
                child: _walletCredit(widget.dashboardProvider),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _receivedLast24Hours(widget.dashboardProvider),
                  _stillPending(widget.dashboardProvider),
                  _sentLast24Hours(widget.dashboardProvider),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _walletInformation(DashboardProvider provider) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.asset(
              "assets/logo.png",
              width: 35.0,
              height: 35.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
            ),
            Text(
              "MY WALLET",
              style: normalTextStyle,
            ),
          ],
        ),
        Icon(
          FontAwesomeIcons.qrcode,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _walletCredit(DashboardProvider provider) {
    return Column(
      children: <Widget>[
        Text("TOTAL BALANCE:",style: normalTextStyle),
        Text(
          "SCR 12189.12",
          style: const TextStyle(fontSize: 36.0, color: Colors.white),
        )
      ],
    );
  }

  Widget _receivedLast24Hours(DashboardProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          "RECEIVED 24h",
          style: smallTextStyle,
        ),
        Row(
          children: <Widget>[
            Icon(
              EvaIcons.arrowDownwardOutline,
              color: Colors.white,
              size: 18.0,
            ),
            Text("SCR 4512.12", style: normalTextStyle)
          ],
        )
      ],
    );
  }

  Widget _stillPending(DashboardProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "PENDING",
          style: smallTextStyle,
        ),
        Text("SCR 215.66", style: normalTextStyle),
      ],
    );
  }

  Widget _sentLast24Hours(DashboardProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "SENT 24h",
          style: smallTextStyle,
        ),
        Row(
          children: <Widget>[
            Icon(
              EvaIcons.arrowUpwardOutline,
              color: Colors.white,
              size: 18.0,
            ),
            Text("SCR 7524.89", style: normalTextStyle)
          ],
        )
      ],
    );
  }
}
