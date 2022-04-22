import 'package:camp_final/app/modules/home/domain/entities/wellness_entity.dart';

class WellnessMapper {
  WellnessEntity to(Map<String, dynamic> map) {
    return WellnessEntity(
      id: map['id'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }
}
