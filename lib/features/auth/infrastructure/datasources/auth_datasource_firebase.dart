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
    print("H");
    try {
      String uid = await firebaseApi.logInUser(email, password) ?? "";

      final data = (await firebaseApi.getUser(uid));
      // print(result);
      User user = UserMapper.userJsonToEntity(data);

      return user;
    } catch (e) {
      print(e);
      print("Error");
      return User(id: "", email: email, fullname: "****", phone: '');
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
