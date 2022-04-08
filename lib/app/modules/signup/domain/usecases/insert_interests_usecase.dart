import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/user_interests_entity.dart';

abstract class InsertInterestsUsecase {
  Future<Either<Failure, Unit>> call(UserInterestsEntity userInterestsEntity);
}
