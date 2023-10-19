import 'package:dio/dio.dart';
import 'package:gestion_inventario/features/auth/domain/domain.dart';

class AuthDatasourceFirebase extends AuthDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: '',
    ),
  );
  @override
  Future<User> login({required email, required password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<User> register(
      {required String email,
      required String password,
      required String userName,
      required String phone}) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
