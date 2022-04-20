import 'package:camp_final/app/modules/home/domain/entities/mood_entity.dart';
import 'package:camp_final/app/modules/home/domain/repositories/home_events_repository.dart';
import 'package:camp_final/app/shared/domain/helpers/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'get_mood_usecase.dart';

class GetMoodUsecaseImpl implements GetMoodUsecase {
  final HomeEventsRepository _repository;

  const GetMoodUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<MoodEntity>>> call() async {
    final result = await _repository.getMoodsHome();
    return result;
  }
}
