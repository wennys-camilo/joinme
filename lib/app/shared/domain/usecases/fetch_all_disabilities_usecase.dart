import 'package:dartz/dartz.dart';
import '../entites/disabilities_enity.dart';
import '../helpers/errors/failure.dart';

abstract class FetchAllDisabilitiesUsecase {
  Future<Either<Failure, List<DisabilitiesEntity>>> call();
}
