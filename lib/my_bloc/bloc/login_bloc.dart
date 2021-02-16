import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dicas_e_macetes/my_bloc/bloc/data/repositories/authenticate_repository_impl.dart';
import 'package:dicas_e_macetes/my_bloc/bloc/domain/interfaces_repositories/authenticate_repository.dart';
import 'package:dicas_e_macetes/my_bloc/bloc/domain/usercase/authenticate.dart';
import 'package:dicas_e_macetes/my_bloc/bloc/external/auth_service.dart';
import 'package:dicas_e_macetes/my_bloc/bloc/domain/entity/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IAuthenticate authenticate = Authenticate(
    repository: AuthenticateRepositoryImpl(
      datasource: AuthenticateDatasourceImpl(),
    ),
  );
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SignInEvent) {
      try {
        yield LoadingLoginState();
        final User user = await authenticate(event.email, event.passaword);
        if (user == null) {
          yield ErroLoginState(message: "login ou senha invalidos");
        } else {
          yield SuccesLoginState(user: user);
        }
      } catch (e) {
        yield ErroLoginState(message: "alguma coisa deu errado");
        throw Exception(e);
      }
    }
  }

  void dispose() {
    this.close();
  }
}
