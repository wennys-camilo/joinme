import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/attendees_entity.dart';
import '../entities/attendees_response_entity.dart';

abstract class SetAttendeesStatusUsecase {
  Future<Either<Failure, AttendeesReponseEntity>> call(AttendeesEntity entity);
}
