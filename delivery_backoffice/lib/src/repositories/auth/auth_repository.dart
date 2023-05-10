import '../../models/auth_model.dart';

abstract class AuthRespository {
  Future<AuthModel> login(
    String email,
    String password,
  );
}
