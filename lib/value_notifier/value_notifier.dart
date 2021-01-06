import 'package:dicas_e_macetes/value_notifier/value_notifier_controller.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class MyValueNotifier extends StatefulWidget {
  @override
  _MyValueNotifier createState() => _MyValueNotifier();
}

class _MyValueNotifier extends State<MyValueNotifier> {
  final controller = MyValueNotifierController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rxObserver(
      () {
        print(controller.counter);
      },
      //filtros
      filter: () => controller.counter != 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    print("build MyValueNotifier");
    return Center(
      child: Container(
        height: 200,
        child: Column(
          children: [
            RxBuilder(
                //filtros
                filter: () => controller.counter != 3,
                builder: (_) {
                  print("build RxBuilder");
                  return Text(
                    "${controller.counter}",
                    style: TextStyle(fontSize: 40),
                  );
                }),
            RaisedButton(
              onPressed: controller.increment,
              color: Colors.blue,
              elevation: 5,
              child: Icon(Icons.add),
            ),
            RaisedButton(
              onPressed: controller.reset,
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
