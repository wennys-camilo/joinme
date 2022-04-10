class UserEntity {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? emergencyName;
  final String? emergencyPhone;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.emergencyName,
    this.emergencyPhone,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
}
