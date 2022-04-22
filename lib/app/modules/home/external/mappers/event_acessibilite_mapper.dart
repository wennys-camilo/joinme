import '../../domain/entities/event_acessibilitie_entity.dart';
import 'accesibilitie_mapper.dart';

class EventAccessibilitieMapper {
  EventAccessibilitieEntity to(Map<String, dynamic> map) {
    return EventAccessibilitieEntity(
      accessibilities: AccessibiliteMapper().to(map['accessibilities']),
    );
  }
}
