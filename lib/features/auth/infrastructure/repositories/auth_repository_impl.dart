import 'package:gestion_inventario/features/auth/domain/domain.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<UserEntity> login({required String email, required String password}) {
    return dataSource.login(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserEntity> register(
      {required String email,
      required String password,
      required String businessname,
      required String username,
      required String phone}) {
    return dataSource.register(
      email: email,
      password: password,
      username: username,
      phone: phone,
      businessname: businessname,
    );
  }
}
