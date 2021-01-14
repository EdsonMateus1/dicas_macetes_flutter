import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Inherited_widget_provider.dart';

class MyInheritedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = CounterContrroler.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: controller.counter,
            builder: (context, value, child) {
              return Text(value.toString());
            },
          ),
        ),
      ),
      floatingActionButton: Container(
        child: FloatingActionButton(
          elevation: 5,
          onPressed: controller.increment,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
