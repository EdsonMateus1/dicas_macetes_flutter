import 'package:dicas_e_macetes/my_bloc/bloc/user.dart';

class MYAuthService {
  // regra de negocio (usercase)
  Future<User> call(String email, String passaword) {
    return Future.delayed(Duration(seconds: 1), () {
      if (email == "teste@email.com" && passaword == "123") {
        return User(
          email: "teste@email.com",
          name: "fulano",
        );
      }
    });
  }
}
