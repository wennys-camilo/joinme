import 'package:dartz/dartz.dart';
import '../../../../shared/domain/entites/disabilities_enity.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class FetchUserDisabilitiesUsecase {
  Future<Either<Failure, List<DisabilitiesEntity>>> call();
}
