import 'package:gestion_inventario/features/auth/domain/domain.dart';

class UserMapper {
<<<<<<< HEAD
  static User userJsonToEntity(Map<String, dynamic> json) => User(
        id: json['uid'],
        email: json['email'],
        fullname: json['name'],
        phone: json['phone'],
=======
  static UserEntity userFirebaseToEntity(User user) => UserEntity(
        id: user.uid,
        username: user.displayName ?? '',
        email: user.email ?? '',
        photoPath: user.photoURL,
        phone: user.phoneNumber ?? '',
        businessname: '',
      );
  static UserEntity userFirestoreToEntity(
          {required Map<String, dynamic> json, required String id}) =>
      UserEntity(
        id: id,
        username: json['username'],
        email: json['email'],
        photoPath: json['photoPath'] ?? '',
        phone: json['phone'],
        businessname: json['businessName'],
>>>>>>> e959f53474d3e1bacb5431eca78b027876519f2a
      );
}
