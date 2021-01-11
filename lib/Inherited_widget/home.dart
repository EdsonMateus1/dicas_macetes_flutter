import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Inherited_widget_provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = CounterContrroler.of(context);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ValueListenableBuilder(
              valueListenable: controller.counter,
              builder: (context, value, child) {
                return Text(value.toString());
              },
            ),
          ),
          RaisedButton(
            onPressed: controller.increment,
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
