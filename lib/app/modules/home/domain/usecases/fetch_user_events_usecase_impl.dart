import 'package:camp_final/app/modules/home/domain/entities/event_description_entity.dart';
import 'package:camp_final/app/modules/home/domain/repositories/user_repositoy.dart';
import 'package:camp_final/app/shared/domain/helpers/errors/failure.dart';
import 'package:dartz/dartz.dart';

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
