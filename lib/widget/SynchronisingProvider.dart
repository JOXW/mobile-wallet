import 'package:flutter/widgets.dart';

class SynchronisingProvider extends ChangeNotifier {
  bool _isSynchronising = false;
  bool get isSynchronising => _isSynchronising;
}