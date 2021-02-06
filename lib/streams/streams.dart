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
  void dispose() {
    controller.closeFluxo();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My streams'),
      ),
      body: Container(
        child: StreamBuilder<List<ResultModal>>(
          stream: controller.myStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("erro");
            }
            if (!snapshot.hasData) {
              return Text("aperte para requisitar");
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) => Card(
                child: ListTile(
                  leading: Text(
                    "${snapshot.data[i].userId}",
                  ),
                  title: Text(
                    "${snapshot.data[i].title}",
                  ),
                  trailing: Text(
                    "${snapshot.data[i].id}",
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: Icon(Icons.add),
        onPressed: controller.iniciarFluxo,
      ),
    );
  }
}
