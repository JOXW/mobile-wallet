import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securus_wallet/ThemeNotifier.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      SwitchListTile(
                  value: false,
                  onChanged: (bool value) {Provider.of<ThemeNotifier>(context).switchTheme();},
                  title: new Text('Change Theme', style: new TextStyle(fontWeight: FontWeight.bold)),
              )
    ],);
  }
}