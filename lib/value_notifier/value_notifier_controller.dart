import 'package:flutter/cupertino.dart';
import 'package:rx_notifier/rx_notifier.dart';

class MyValueNotifierController {
  final _counter = RxNotifier<int>(0);

  int get counter => _counter.value;

  void increment() {
    _counter.value++;
  }

  void reset() {
    _counter.value = 0;
  }
}
