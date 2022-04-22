import '../../../../shared/domain/entites/disabilities_enity.dart';
import '../../../../shared/domain/entites/user_enity.dart';
import '../../domain/entities/activities_description_entity.dart';
import '../../domain/entities/event_description_entity.dart';

abstract class UserRemoteDataSource {
  Future<void> postMood(String moodId);
  Future<UserEntity> fetchUser();
  Future<List<ActivitiesDescriptionEntity>> fetchActivities();
  Future<List<EventDescriptionEntity>> userEvents();
  Future<List<DisabilitiesEntity>> disabilities();
}
