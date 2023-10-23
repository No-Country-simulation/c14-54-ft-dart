import 'package:gestion_inventario/features/auth/domain/domain.dart';

abstract class AuthRepository {
  Future<UserEntity> login({
    required String email,
    required String password,
  });
  Future<UserEntity> register({
    required String email,
    required String password,
    required String username,
    required String phone,
  });
}
