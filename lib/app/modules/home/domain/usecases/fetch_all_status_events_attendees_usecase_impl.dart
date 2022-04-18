import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/attendees_response_entity.dart';
import '../repositories/home_events_repository.dart';
import 'fetch_all_status_events_attendees_usecase.dart';

class FetchAllStatusEventsAttendeesUsecaseImpl
    implements FetchAllStatusEventsAttendeesUsecase {
  final HomeEventsRepository _repository;

  FetchAllStatusEventsAttendeesUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<AttendeesReponseEntity>>> call(
      String type) async {
    final result = await _repository.status(type);
    return result;
  }
}
