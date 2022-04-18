import 'package:dartz/dartz.dart';

import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/attendees_response_entity.dart';

abstract class FetchAllStatusEventsAttendeesUsecase {
  Future<Either<Failure, List<AttendeesReponseEntity>>> call(String type);
}
