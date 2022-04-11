class AccessibilitiesEntity {
  final String id;
  final String name;
  final String description;
  final bool active;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;
  AccessibilitiesEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
}
