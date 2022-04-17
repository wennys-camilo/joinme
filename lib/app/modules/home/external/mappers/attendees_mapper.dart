import '../../domain/entities/attendees_entity.dart';
import '../../domain/entities/attendees_response_entity.dart';

class AtendeesMapper {
  Map<String, dynamic> to(AttendeesEntity attendeesEntity) {
    return {
      'status': attendeesEntity.status,
      'eventId': attendeesEntity.eventId,
    };
  }

  AttendeesReponseEntity from(Map<String, dynamic> map) {
    return AttendeesReponseEntity(
      id: map['id'] ?? '',
      status: map['status'] ?? '',
      userId: map['userId'] ?? '',
      eventId: map['eventId'] ?? '',
    );
  }
}
