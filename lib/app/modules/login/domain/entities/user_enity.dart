class UserEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;
  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
}
