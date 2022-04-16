import '../../domain/entities/event_description_entity.dart';

abstract class HomeEventsRemoteDataSource {
  Future<List<EventDescriptionEntity>> events();
}
