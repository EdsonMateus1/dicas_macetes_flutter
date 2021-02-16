import 'package:dicas_e_macetes/my_bloc/data/datasource/authenticate_datasource.dart';
import 'package:dicas_e_macetes/my_bloc/data/model/user_model.dart';

class AuthenticateDatasourceImpl implements IAuthenticateDatasource {
  @override
  Future<UserModel> authenticate(String email, String passaword) {
    return Future.delayed(Duration(seconds: 1), () {
      if (email == "teste@email.com" && passaword == "123") {
        return UserModel(
          email: "teste@email.com",
          name: "fulano",
        );
      } else {
        throw Exception("login erro");
      }
    });
  }
}
