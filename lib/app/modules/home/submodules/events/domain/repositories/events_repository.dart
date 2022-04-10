import 'package:dartz/dartz.dart';
import '../../../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/accessibilities_entities.dart';

abstract class EveventsRepository {
  Future<Either<Failure, List<AccessibilitiesEntity>>> accessibilitiesEvent();
}
