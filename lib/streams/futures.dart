import 'package:dicas_e_macetes/streams/api_controller.dart';
import 'package:dicas_e_macetes/streams/count_contrroler.dart';
import 'package:dicas_e_macetes/streams/result_modal.dart';
import 'package:flutter/material.dart';

class MyFuTures extends StatefulWidget {
  MyFuTures({Key key}) : super(key: key);

  @override
  _MyFuTures createState() => _MyFuTures();
}

class _MyFuTures extends State<MyFuTures> {
  final FutureContrroler futureContrroler = FutureContrroler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My streams'),
      ),
      body: Center(
        child: FutureBuilder<ResultModal>(
          future: futureContrroler.addResult(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("erro");
            }
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return Text("${snapshot.data.title}");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: futureContrroler.addResult,
      ),
    );
  }
}
