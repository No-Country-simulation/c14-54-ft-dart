import 'package:gestion_inventario/features/auth/domain/domain.dart';

abstract class AuthDataSource {
  Future<User> login({
    required email,
    required password,
  });
  Future<User> register({
    required String email,
    required String password,
    required String userName,
    required String phone,
  });
}
