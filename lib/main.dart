import 'package:dicas_e_macetes/Inherited_widget/Inherited_widget_provider.dart';
import 'package:dicas_e_macetes/Inherited_widget/home.dart';
import 'package:dicas_e_macetes/streams/futures.dart';
import 'package:dicas_e_macetes/streams/streams.dart';
//import 'package:dicas_e_macetes/value_notifier/value_notifier.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyFuTures());
  }
}
