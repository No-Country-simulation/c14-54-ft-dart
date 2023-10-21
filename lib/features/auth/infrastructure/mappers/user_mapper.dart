import 'package:gestion_inventario/features/auth/domain/domain.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
        id: json['uid'],
        email: json['email'],
        fullname: json['name'],
        phone: json['phone'],
      );
}
