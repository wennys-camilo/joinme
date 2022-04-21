import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/activities_description_entity.dart';

abstract class FetchUserInterestsUsecase {
  Future<Either<Failure, List<ActivitiesDescriptionEntity>>> call();
}
