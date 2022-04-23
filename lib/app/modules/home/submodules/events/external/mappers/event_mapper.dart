import '../../domain/entities/event_entity.dart';

class EventMapper {
  Map<String, dynamic> to(EventEntity event) {
    return {
      'name': event.name,
      'description': event.description,
      'isOnline': event.isOnline,
      'url': event.url,
      'date': event.date,
      'isPetFriendly': event.isPetFriendly,
      'maxParticipants': event.maxParticipants,
      'startTime': event.startTime,
      'endTime': event.endTime,
      'activityId': event.activityId,
      'price': event.price,
      'userIdentity': event.userIdentity,
      'accessibilities': event.accessibilities,
    };
  }
}
