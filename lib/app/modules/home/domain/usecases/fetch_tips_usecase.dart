import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/wellness_entity.dart';

abstract class FetchTipsUsecase {
  Future<Either<Failure, List<WellnessEntity>>> call();
}
