import 'package:dicas_e_macetes/my_bloc/bloc/data/model/user_model.dart';

abstract class IAuthenticateDatasource {
  Future<UserModel> authenticate(String email, String passaword);
}
