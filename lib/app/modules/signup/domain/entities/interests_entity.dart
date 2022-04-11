class InterestsEntity {
  final String id;
  final String name;
  final bool active;
  final String urlActive;
  final String urlInactive;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;
  InterestsEntity({
    required this.id,
    required this.name,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.urlActive,
    required this.urlInactive,
  });
}
