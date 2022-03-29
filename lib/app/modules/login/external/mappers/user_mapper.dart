import '../../domain/entities/user_enity.dart';

class UserMapper {
  UserEntity to(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'],
      deletedAt: map['deletedAt'],
    );
  }
}
