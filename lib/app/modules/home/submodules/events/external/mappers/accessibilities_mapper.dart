import '../../domain/entities/accessibilities_entities.dart';

class AccessibilitiesMapper {
  AccessibilitiesEntity to(Map<String, dynamic> map) {
    return AccessibilitiesEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      active: map['active'] ?? false,
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      deletedAt: map['deletedAt'] ?? '',
    );
  }
}
