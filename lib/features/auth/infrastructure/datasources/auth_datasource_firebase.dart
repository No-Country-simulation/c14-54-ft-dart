import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestion_inventario/features/auth/domain/domain.dart';

class AuthDatasourceFirebase extends AuthDataSource {
  final db = FirebaseFirestore.instance;

  @override
  Future<User> login({required String email, required String password}) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      userCredential.user;
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      return throw Exception(e.message);
    }
  }

  @override
  Future<User> register(
      {required String email,
      required String password,
      required String username,
      required String phone}) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      if (user != null) {
        _createUserDocument(
          uid: user.uid,
          username: username,
          email: email,
          phone: phone,
        );
      }
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      return throw Exception(e);
    }
  }

  Future<void> _createUserDocument({
    required String uid,
    required String username,
    required String email,
    required String phone,
  }) async {
    final user = <String, dynamic>{
      "username": username,
      "email": email,
      "phone": phone,
    };

    await db.collection("users").doc(uid).set(user);
  }
}
