class UserEntity {
  final String name;
  final String email;
  final String? phone;
  final String? emergencyName;
  final String? emergencyPhone;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? city;
  UserEntity({
    required this.name,
    required this.email,
    this.phone,
    this.emergencyName,
    this.emergencyPhone,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.city,
  });
}
