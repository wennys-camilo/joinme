import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/event_description_entity.dart';

abstract class FetchAllEventsUsecase {
  Future<Either<Failure, List<EventDescriptionEntity>>> call();
}
