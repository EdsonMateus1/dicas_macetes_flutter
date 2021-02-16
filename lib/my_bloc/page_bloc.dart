import 'package:dicas_e_macetes/my_bloc/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageBloc extends StatefulWidget {
  const PageBloc({Key key}) : super(key: key);

  @override
  _PageBlocState createState() => _PageBlocState();
}

class _PageBlocState extends State<PageBloc> {
  LoginBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _authenticate() {
      final event = SignInEvent(email: "teste@email.com", passaword: "123");
      bloc.add(event);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("bloc page"),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is ErroLoginState) {
            return Center(child: Text("erro no login ${state.message}"));
          } else if (state is LoginInitial) {
            return Center(child: Text("dispare um evento"));
          } else if (state is LoadingLoginState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SuccesLoginState) {
            return Center(
              child: Column(
                children: [
                  Text("Login bem sucedido"),
                  Text("nome: ${state.user.name}"),
                  Text("email: ${state.user.email}"),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.request_page),
        onPressed: _authenticate,
      ),
    );
  }
}
