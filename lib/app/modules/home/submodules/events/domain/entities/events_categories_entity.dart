class EventCategorieEntity {
  final String id;
  final String name;
  final bool active;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  EventCategorieEntity({
    required this.id,
    required this.name,
    required this.active,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
}
