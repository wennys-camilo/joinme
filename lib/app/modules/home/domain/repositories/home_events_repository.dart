import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/attendees_entity.dart';
import '../entities/attendees_response_entity.dart';
import '../entities/event_description_entity.dart';
import '../entities/mood_entity.dart';

abstract class HomeEventsRepository {
  Future<Either<Failure, List<EventDescriptionEntity>>> fetchAll();
  Future<Either<Failure, AttendeesReponseEntity>> attendeesEvents(
      AttendeesEntity entity);
  Future<Either<Failure, List<AttendeesReponseEntity>>> status(String type);

  Future<Either<Failure, List<MoodEntity>>> getMoodsHome();
}
