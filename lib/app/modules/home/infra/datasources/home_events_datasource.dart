import '../../domain/entities/attendees_entity.dart';
import '../../domain/entities/attendees_response_entity.dart';
import '../../domain/entities/event_description_entity.dart';

abstract class HomeEventsRemoteDataSource {
  Future<List<EventDescriptionEntity>> events();
  Future<AttendeesReponseEntity> setAttendees(AttendeesEntity entity);
}
