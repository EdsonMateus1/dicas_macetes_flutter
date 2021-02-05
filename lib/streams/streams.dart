import 'package:dicas_e_macetes/streams/api_controller.dart';
import 'package:dicas_e_macetes/streams/count_contrroler.dart';
import 'package:dicas_e_macetes/streams/result_modal.dart';
import 'package:flutter/material.dart';

class MyStreams extends StatefulWidget {
  MyStreams({Key key}) : super(key: key);

  @override
  _MyStreamsState createState() => _MyStreamsState();
}

class _MyStreamsState extends State<MyStreams> {
  final controller = StreamsContrroler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My streams'),
      ),
      body: Center(
        child: StreamBuilder<ResultModal>(
          stream: controller.myStream,
          builder: (BuildContext context, AsyncSnapshot<ResultModal> snapshot) {
            if (snapshot.hasError) {
              return Text("erro");
            }
            if (!snapshot.hasData) {
              return Text("carregando");
            }
            return Text("${snapshot.data.title}");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: controller.iniciarFluxo,
      ),
    );
  }
}
