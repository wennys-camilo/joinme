import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/attendees_entity.dart';
import '../entities/attendees_response_entity.dart';
import '../repositories/home_events_repository.dart';
import 'set_attendees_status_usecase.dart';

class SetAttendeesStatusUsecaseImpl implements SetAttendeesStatusUsecase {
  final HomeEventsRepository _repository;

  SetAttendeesStatusUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, AttendeesReponseEntity>> call(
      AttendeesEntity entity) async {
    final result = await _repository.attendeesEvents(entity);
    return result;
  }
}
