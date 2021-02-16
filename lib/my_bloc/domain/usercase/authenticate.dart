import 'package:dicas_e_macetes/my_bloc/domain/entity/user.dart';
import 'package:dicas_e_macetes/my_bloc/domain/interfaces_repositories/authenticate_repository.dart';
import 'package:flutter/foundation.dart';

abstract class IAuthenticate {
  Future<User> call(String email, String passaword);
}

class Authenticate implements IAuthenticate {
  final IAuthenticateRepository repository;
  Authenticate({@required this.repository});

  @override
  Future<User> call(String email, String passaword) async {
    return await repository.authenticate(email, passaword);
  }
}
