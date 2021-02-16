import 'package:dicas_e_macetes/my_bloc/domain/entity/user.dart';

class UserModel extends User {
  final String name;
  final String email;

  UserModel({this.name, this.email});
}
