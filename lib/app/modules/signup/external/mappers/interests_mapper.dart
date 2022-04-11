import '../../domain/entities/interests_entity.dart';

class InterestsMapper {
  InterestsEntity to(Map<String, dynamic> map) {
    return InterestsEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      urlActive: map['urlActive'] ?? '',
      urlInactive: map['urlInactive'] ?? '',
      active: map['active'] ?? false,
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      deletedAt: map['deletedAt'] ?? '',
    );
  }
}
