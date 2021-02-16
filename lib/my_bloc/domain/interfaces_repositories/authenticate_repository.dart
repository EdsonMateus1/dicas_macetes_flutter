import 'package:dicas_e_macetes/my_bloc/domain/entity/user.dart';

abstract class IAuthenticateRepository {
  Future<User> authenticate(String email, String passaword);
}
