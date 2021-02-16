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

//  Se o quadro deve notificar os widgets que herdam deste widget.
//  Quando este widget é reconstruído, às vezes precisamos reconstruir os widgets que
//  herdam deste widget, mas às vezes não. Por exemplo, se os dados mantidos por este widget
//  forem os mesmos que os dados mantidos, então não precisamos reconstruir os widgets que
//  herdaram os dados mantidos por .oldWidgetoldWidget
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
