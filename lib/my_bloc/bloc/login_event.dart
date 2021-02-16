part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SignInEvent extends LoginEvent {
  final String email;
  final String passaword;

  SignInEvent({@required this.email, @required this.passaword});
  @override
  List<Object> get props => [email, passaword];
}
