import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/interests_entity.dart';
import '../entities/user_interests_entity.dart';

abstract class InterestsRepository {
  Future<Either<Failure, List<InterestsEntity>>> fetch();

  Future<Either<Failure, Unit>> insert(UserInterestsEntity userInterestsEntity);
}
