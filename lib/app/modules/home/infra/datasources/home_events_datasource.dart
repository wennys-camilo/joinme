import '../../domain/entities/attendees_entity.dart';
import '../../domain/entities/attendees_response_entity.dart';
import '../../domain/entities/event_description_entity.dart';
import '../../domain/entities/mood_entity.dart';
import '../../domain/entities/wellness_entity.dart';

abstract class HomeEventsRemoteDataSource {
  Future<List<EventDescriptionEntity>> events();
  Future<AttendeesReponseEntity> setAttendees(AttendeesEntity entity);
  Future<List<AttendeesReponseEntity>> getStatusList(String type);
  Future<List<MoodEntity>> getMoods();
  Future<List<WellnessEntity>> getWellness();
}
