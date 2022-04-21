import 'package:dartz/dartz.dart';
import '../../../../shared/domain/entites/user_enity.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/activities_description_entity.dart';
import '../entities/event_description_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, Unit>> postMood(id);
  Future<Either<Failure, UserEntity>> fetch();
  Future<Either<Failure, List<ActivitiesDescriptionEntity>>> fetchInterest();
  Future<Either<Failure, List<EventDescriptionEntity>>> fetchEventsUser();
}
