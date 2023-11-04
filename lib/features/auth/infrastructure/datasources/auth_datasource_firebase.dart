import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gestion_inventario/features/auth/domain/domain.dart';
import 'package:gestion_inventario/features/auth/infrastructure/infrastructure.dart';

class AuthDatasourceFirebase extends AuthDataSource {
  final db = FirebaseFirestore.instance;

  @override
  Future<UserEntity> login(
      {required String email, required String password}) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get()
          .then(
            (json) => UserMapper.userFirestoreToEntity(
              id: userCredential.user!.uid,
              json: json.data()!,
            ),
          );
    } on FirebaseAuthException catch (e) {
      return throw Exception(e.message);
    }
  }

  @override
  Future<UserEntity> register({
    required String email,
    required String password,
    required String username,
    required String businessname,
    required String phone,
  }) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;

      _createUserDocument(
        uid: user!.uid,
        username: username,
        businessname: businessname,
        email: email,
        phone: phone,
      );
      final UserEntity userEntity = UserEntity(
        id: user.uid,
        username: username,
        email: email,
        phone: phone,
        photoPath: '',
        businessname: businessname,
      );
      return userEntity;
    } on FirebaseAuthException catch (e) {
      return throw Exception(e);
    }
  }

  Future<void> _createUserDocument({
    required String uid,
    required String username,
    required String email,
    required String phone,
    required String businessname,
  }) async {
    final user = <String, dynamic>{
      "username": username,
      "email": email,
      "phone": phone,
      "businessName": businessname,
    };

    await db.collection("users").doc(uid).set(user);
  }

  @override
  Future<String> uploadImage({required String path, required String id}) {
    final FirebaseStorage storage = FirebaseStorage.instance;
    try {
      // final String fileName = path.split('/').last;
      const String fileName = 'profile_picture';
      final ref =
          storage.ref().child('profile_picture/users/$id').child(fileName);
      final uploadTask = ref.putFile(File(path));
      uploadTask.whenComplete(() async {
        final url = await ref.getDownloadURL();
        await db.collection('users').doc(id).update({'photoPath': url});
        return url;
      });
      return Future.value('');
    } on FirebaseException catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<UserEntity> getUser({required String id}) {
    return db
        .collection('users')
        .doc(id)
        .get()
        .then((json) => UserMapper.userFirestoreToEntity(
              id: id,
              json: json.data()!,
            ));
  }
}
