class UserEntity {
  final String id;
  final String username;
  final String email;
  final String? photoPath;
  final String phone;

  UserEntity({
    required this.id,
    required this.username,
    required this.email,
    this.photoPath,
    required this.phone,
  });
}
