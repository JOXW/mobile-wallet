import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:securus_wallet/data/Transaction.dart';
import 'package:intl/intl.dart';
import 'package:securus_wallet/data/TransactionStatus.dart';
import 'package:securus_wallet/data/TransactionType.dart';

class TransactionWidget extends StatefulWidget {
  final Transaction transaction;

  TransactionWidget({this.transaction});

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 8.0, bottom: 8.0, left: 12.0, right: 29.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _dateWidget(widget.transaction.transactionDate),
                _transactionStatus(widget.transaction),
              ],
            ),
            _transactionValue(widget.transaction),
          ],
        ),
      ),
    );
  }

  Widget _transactionValue(Transaction transaction) {
    final numberFormatter = NumberFormat('#.######');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          " " + numberFormatter.format(widget.transaction.amount),
          style: TextStyle(color: getTransactionTypeColor(transaction.transactionType), fontSize: 18.0),
        ),
        Text(
          "- fee: " + numberFormatter.format(widget.transaction.fee),
          style: Theme.of(context).textTheme.body1,
        ),
      ],
    );
  }

  Widget _dateWidget(DateTime transactionDate) {
    var monthFormatter = DateFormat("MMM");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          transactionDate.day.toString(),
          style: Theme.of(context).textTheme.body1,
        ),
        Text(
          monthFormatter.format(transactionDate),
          style: Theme.of(context).textTheme.body1,
        )
      ],
    );
  }

  Widget _transactionStatus(Transaction transaction) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "SCR",
            style: Theme.of(context).textTheme.title,
          ),
          _status(widget.transaction)
        ],
      ),
    );
  }

  Widget _status(Transaction transaction) {
    switch (transaction.transactionStatus) {
      case TransactionStatus.APPROVED:
        return (_statusWidget(
            FontAwesomeIcons.solidCheckCircle, "APPROVED", Colors.green));
        break;
      case TransactionStatus.PENDING:
        return (_statusWidget(FontAwesomeIcons.exclamationTriangle, "PENDING",
            Colors.amberAccent));
        break;
      case TransactionStatus.ERROR:
        return (_statusWidget(
            FontAwesomeIcons.exclamationCircle, "REJECTED", Colors.red));
        break;
      default:
        return (_statusWidget(
            FontAwesomeIcons.exclamationCircle, "REJECTED", Colors.red));
        break;
    }
  }

  Widget _statusWidget(IconData icon, String text, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Icon(
          icon,
          size: 16.0,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Text(
            text,
            style: TextStyle(color: color, fontSize: 12.0),
          ),
        )
      ],
    );
  }

  Color getTransactionTypeColor(TransactionType type) {
    switch (type) {
      case TransactionType.SENT:
        return Colors.red;
        break;
      case TransactionType.RECEIVED:
        return Colors.green;
        break;
      default:
        return Colors.red;
    }
  }
}
