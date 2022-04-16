import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/event_description_entity.dart';
import '../repositories/home_events_repository.dart';
import 'fetch_all_events_usecase.dart';

class FetchAllEventsUsecaseImpl implements FetchAllEventsUsecase {
  final HomeEventsRepository _repository;

  FetchAllEventsUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<EventDescriptionEntity>>> call() async {
    final result = await _repository.fetchAll();
    return result;
  }
}
