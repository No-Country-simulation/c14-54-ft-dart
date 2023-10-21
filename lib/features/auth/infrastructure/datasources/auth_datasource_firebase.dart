import 'package:dio/dio.dart';
import 'package:gestion_inventario/features/auth/domain/domain.dart';
import 'package:gestion_inventario/features/auth/infrastructure/infrastructure.dart';
import 'package:gestion_inventario/features/data/api/repository/firebase_api.dart';

class AuthDatasourceFirebase extends AuthDataSource {
  final FirebaseApi firebaseApi = FirebaseApi();
  final dio = Dio(
    BaseOptions(
      baseUrl: '',
    ),
  );
  @override
  Future<User> login({required email, required password}) async {
    // print("H");
    try {
      String uid = await firebaseApi.logInUser(email, password) ?? "";

      final data = (await firebaseApi.getUser(uid));
      // print("DATA");
      // print(uid);
      // print(data);
      User user = UserMapper.userJsonToEntity(data);
      // print(user.fullname);
      // print(user);
      return user;
    } catch (e) {
      // print("Error");
      // print(e);
      throw UnimplementedError();
    }
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
