import 'package:dio/dio.dart';
import 'package:gestion_inventario/features/auth/domain/domain.dart';
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
      var result = await firebaseApi.logInUser(email, password);
      print(result);
      
      return User(id: result.toString(), email: email, fullname: "****");
    } catch (e) {
      print(e);
      print("Error");
      return User(id: "", email: email, fullname: "****");
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
