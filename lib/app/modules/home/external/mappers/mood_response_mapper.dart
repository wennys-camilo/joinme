import '../../domain/entities/mood_entity.dart';
import 'mood_type_mapper.dart';

class MoodResponseMapper {
  MoodEntity to(Map<String, dynamic> map) {
    return MoodEntity(
        id: map['id'] ?? '',
        name: map['name'] ?? '',
        activate: map['activate'] ?? '',
        typeIcon: MoodTypeMapper().to(map['name']));
  }
}
