import 'package:dicas_e_macetes/my_bloc/data/datasource/authenticate_datasource.dart';
import 'package:dicas_e_macetes/my_bloc/data/model/user_model.dart';
import 'package:dicas_e_macetes/my_bloc/domain/interfaces_repositories/authenticate_repository.dart';
import 'package:flutter/foundation.dart';

class AuthenticateRepositoryImpl implements IAuthenticateRepository {
  final IAuthenticateDatasource datasource;
  AuthenticateRepositoryImpl({@required this.datasource});

  @override
  Future<UserModel> authenticate(String email, String passaword) async {
    return await datasource.authenticate(email, passaword);
  }
}
