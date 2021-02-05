import 'package:flutter/material.dart';

class CounterContrroler extends InheritedWidget {
  final counter = ValueNotifier<int>(0);

  CounterContrroler({int initialValue = 0, @required Widget child})
      : super(child: child) {
    counter.value = initialValue;
  }

  static CounterContrroler of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterContrroler>();
  }

  int increment() => counter.value++;

  int get value => counter.value;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
