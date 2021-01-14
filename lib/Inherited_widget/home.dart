import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Inherited_widget_provider.dart';
import 'MyInheritedWidget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterContrroler(
      child: MyInheritedWidget(),
    );
  }
}
