import 'package:gestion_inventario/features/auth/domain/domain.dart';

class UserMapper {
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
      );
}
