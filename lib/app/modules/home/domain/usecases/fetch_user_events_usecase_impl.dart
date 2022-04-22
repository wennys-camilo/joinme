import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/event_description_entity.dart';
import '../repositories/user_repositoy.dart';
import 'fetch_user_events_usecase.dart';

class FetchUserEventsUsecaseImpl implements FetchUserEventsUsecase {
  final UserRepository _repository;

  const FetchUserEventsUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<EventDescriptionEntity>>> call() async {
    final result = await _repository.fetchEventsUser();
    return result;
  }
}
