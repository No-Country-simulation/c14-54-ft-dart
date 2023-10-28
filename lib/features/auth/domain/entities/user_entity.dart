class UserEntity {
  final String id;
  final String username;
  final String businessname;
  final String email;
  final String? photoPath;
  final String phone;

  UserEntity({
    required this.businessname,
    required this.id,
    required this.username,
    required this.email,
    this.photoPath,
    required this.phone,
  });
}
