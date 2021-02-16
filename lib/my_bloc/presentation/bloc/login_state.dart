part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => null;
}

class LoadingLoginState extends LoginState {
  @override
  List<Object> get props => null;
}

class SuccesLoginState extends LoginState {
  final User user;

  SuccesLoginState({@required this.user});

  @override
  List<Object> get props => [user];
}

class ErroLoginState extends LoginState {
  final String message;

  ErroLoginState({@required this.message});

  @override
  List<Object> get props => null;
}
