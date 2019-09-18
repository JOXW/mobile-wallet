import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:securus_wallet/widget/SynchronisingProvider.dart';

class SynchronisingWidget extends StatefulWidget {
  @override
  _SynchronisingWidgetState createState() => _SynchronisingWidgetState();
}

class _SynchronisingWidgetState extends State<SynchronisingWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SynchronisingProvider>(
      builder: (context, provider, child) => Material(
        child: provider.isSynchronising
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "2413423/123991292",
                      style: TextStyle(color: Colors.black),
                    ),
                    FittedBox(
                      child: LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 14.0,
                        percent: 0.7,
                        progressColor: Colors.blue,
                        center: Text(
                          "70.0%",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }
}
