import 'package:dartz/dartz.dart';
import '../../../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/accessibilities_entities.dart';

abstract class FetchAccessibilitiesEventsUsecase {
  Future<Either<Failure, List<AccessibilitiesEntity>>> call();
}
