import '../../domain/entites/user_enity.dart';

class UserMapper {
  UserEntity to(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      emergencyName: map['emergencyName'] ?? '',
      emergencyPhone: map['emergencyPhone'],
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'],
      deletedAt: map['deletedAt'],
    );
  }
}
