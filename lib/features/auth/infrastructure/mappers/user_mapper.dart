import 'package:gestion_inventario/features/auth/domain/domain.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        fullname: json['fullName'],
        phone: json['phone'],
      );
}
