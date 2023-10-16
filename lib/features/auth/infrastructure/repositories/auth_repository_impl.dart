import 'package:gestion_inventario/features/auth/domain/domain.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<User> login({required email, required password}) {
    return dataSource.login(
      email: email,
      password: password,
    );
  }

  @override
  Future<User> register(
      {required String email,
      required String password,
      required String userName,
      required String phone}) {
    return dataSource.register(
      email: email,
      password: password,
      userName: userName,
      phone: phone,
    );
  }
}
