import '../../domain/entites/user_enity.dart';

class UserMapper {
  UserEntity to(Map<String, dynamic> map) {
    return UserEntity(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      emergencyName: map['emergencyName'] ?? '',
      emergencyPhone: map['emergencyPhone'],
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'],
      deletedAt: map['deletedAt'],
      city: map['city'] ?? '',
      aboutMe: map['aboutMe'] ?? '',
      isPremium: map['isPremium'] ?? false,
    );
  }
}
