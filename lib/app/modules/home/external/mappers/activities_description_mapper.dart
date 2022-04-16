import '../../domain/entities/activities_description_entity.dart';

class ActivitiesDescriptionMapper {
  ActivitiesDescriptionEntity to(Map<String, dynamic> map) {
    return ActivitiesDescriptionEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      active: map['active'] ?? false,
      urlActive: map['urlActive'] ?? '',
      urlInactive: map['urlInactive'] ?? '',
    );
  }
}
