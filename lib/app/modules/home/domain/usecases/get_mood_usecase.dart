import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/mood_entity.dart';

abstract class GetMoodUsecase {
  Future<Either<Failure, List<MoodEntity>>> call();
}
