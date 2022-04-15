class EventEntity {
  final String name;
  final String description;
  final bool isOnline;
  final String? url;
  final String date;
  final bool isPetFriendly;
  final int maxParticipants;
  final String startTime;
  final String? endTime;
  final String activityId;
  final double price;
  final String userIdentity;
  final List<String>? accessibilities;
  EventEntity({
    required this.name,
    required this.description,
    required this.isOnline,
    this.url,
    required this.date,
    required this.isPetFriendly,
    required this.maxParticipants,
    required this.startTime,
    this.endTime,
    required this.activityId,
    required this.price,
    required this.userIdentity,
    this.accessibilities,
  });
}
