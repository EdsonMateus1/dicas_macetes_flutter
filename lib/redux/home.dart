import 'package:dicas_e_macetes/redux/app_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeRedux extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedBuilder(
        animation: appStore,
        builder: (ctx, _) {
          return Text(
            appStore.state.value.toString(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          appStore.dispatcher(AppAction.decrement);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
