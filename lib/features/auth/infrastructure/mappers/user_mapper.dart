import 'package:gestion_inventario/features/auth/domain/domain.dart';

class UserMapper {
  static UserEntity userFirebaseToEntity(User user) => UserEntity(
        id: user.uid,
        username: user.displayName ?? '',
        email: user.email ?? '',
        photoPath: user.photoURL,
        phone: user.phoneNumber ?? '',
      );
}
