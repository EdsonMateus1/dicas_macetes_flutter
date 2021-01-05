import 'package:flutter/material.dart';

class MyValueNotifier extends StatefulWidget {
  @override
  _MyValueNotifier createState() => _MyValueNotifier();
}

class _MyValueNotifier extends State<MyValueNotifier> {
  final counter = ValueNotifier<int>(0);
  void incrementCounter() {
    counter.value++;
  }

  void reset() {
    counter.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    print("build MyValueNotifier");
    return Center(
      child: Container(
        height: 200,
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: counter,
                builder: (context, value, child) {
                  print("build ValueListenableBuilder");
                  return Text(
                    "${counter.value}",
                    style: TextStyle(fontSize: 40),
                  );
                }),
            RaisedButton(
              onPressed: incrementCounter,
              color: Colors.blue,
              elevation: 5,
              child: Icon(Icons.add),
            ),
            RaisedButton(
              onPressed: reset,
              color: Colors.blue,
              elevation: 5,
              child: Icon(Icons.clear),
            )
          ],
        ),
      ),
    );
  }
}
