import '../../domain/entities/acessibilities_entity.dart';

class AccessibiliteMapper {
  AccessibilitiesEntity to(Map<String, dynamic> map) {
    return AccessibilitiesEntity(
      name: map['name'] ?? '',
    );
  }
}
