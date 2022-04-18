import 'event_description_entity.dart';

class AttendeesReponseEntity {
  final String id;
  final String status;
  final String userId;
  final String eventId;
  final EventDescriptionEntity? event;
  AttendeesReponseEntity({
    required this.id,
    required this.status,
    required this.userId,
    required this.eventId,
    this.event,
  });
}
