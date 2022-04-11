import 'package:dartz/dartz.dart';
import '../../../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/accessibilities_entities.dart';
import '../repositories/events_repository.dart';
import 'fetch_accessibilities_events_usecase.dart';

class FetchAccessibilitiesEventsUsecaseImpl
    implements FetchAccessibilitiesEventsUsecase {
  final EventsRepository _repository;

  FetchAccessibilitiesEventsUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<AccessibilitiesEntity>>> call() async {
    final result = await _repository.accessibilitiesEvent();
    return result;
  }
}
