import 'package:dicas_e_macetes/streams/api_controller.dart';
import 'package:dicas_e_macetes/streams/count_contrroler.dart';
import 'package:dicas_e_macetes/streams/result_modal.dart';
import 'package:flutter/material.dart';

class MyFuTures extends StatelessWidget {
  final FutureContrroler futureContrroler = FutureContrroler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My futures'),
      ),
      body: Center(
        child: FutureBuilder<List<ResultModal>>(
          future: futureContrroler.getResult,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("erro");
            }
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => futureContrroler.getResult,
      ),
    );
  }
}
