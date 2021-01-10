import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Inherited_widget_provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = CounterContrroler.of(context);
    return Center(
      child: Row(
        children: [
          Container(
            width: 200,
            child: ValueListenableBuilder(
              valueListenable: controller.counter,
              builder: (context, value, child) {
                return Text(value);
              },
            ),
          ),
          RaisedButton.icon(onPressed: null, icon: null, label: null)
        ],
      ),
    );
  }
}
