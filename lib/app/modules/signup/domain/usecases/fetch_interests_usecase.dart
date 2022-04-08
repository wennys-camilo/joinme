import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/interests_entity.dart';

abstract class FetchInterestsUsecase {
  Future<Either<Failure, List<InterestsEntity>>> call();
}
