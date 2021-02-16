import 'package:dicas_e_macetes/my_bloc/page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_bloc/bloc/login_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      child: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: PageBloc(),
      ),
    ));
  }
}
