import 'package:camp_final/app/shared/domain/helpers/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../entites/disabilities_enity.dart';

abstract class FetchAllDisabilitiesUsecase {
  Future<Either<Failure, List<DisabilitiesEntity>>> call();
}
