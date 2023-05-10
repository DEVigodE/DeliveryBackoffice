// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../core/global/constants.dart';
import '../../core/storage/storage.dart';

import '../../repositories/auth/auth_repository.dart';
import './login_service.dart';

class LoginServiceImpl implements LoginService {
  final AuthRespository _authRespository;

  final Storage _storage;
  LoginServiceImpl(
    this._authRespository,
    this._storage,
  );

  @override
  Future<void> execute(String email, String password) async {
    final authModel = await _authRespository.login(
      email,
      password,
    );
    _storage.setData(
      SessionStorageKeys.accessToken.key,
      authModel.accessToken,
    );
  }
}
