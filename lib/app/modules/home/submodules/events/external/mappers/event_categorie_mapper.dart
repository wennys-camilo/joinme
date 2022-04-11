import '../../domain/entities/events_categories_entity.dart';

class EventCategorieMapper {
  EventCategorieEntity to(Map<String, dynamic> map) {
    return EventCategorieEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      active: map['active'] ?? false,
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      deletedAt: map['deletedAt'],
    );
  }
}
