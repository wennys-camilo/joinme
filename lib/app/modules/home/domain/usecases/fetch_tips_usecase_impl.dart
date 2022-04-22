import 'package:camp_final/app/modules/home/domain/entities/wellness_entity.dart';
import 'package:camp_final/app/modules/home/domain/repositories/home_events_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import 'fetch_tips_usecase.dart';

class FetchTipsUsecaseImpl implements FetchTipsUsecase {
  final HomeEventsRepository _repository;

  const FetchTipsUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<WellnessEntity>>> call() async {
    final result = await _repository.getTips();
    return result;
  }
}
