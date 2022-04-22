import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/user_disabilities_entity.dart';

abstract class InsertDisabilitiesUsecase {
  Future<Either<Failure, Unit>> call(
      UserDisabilitiesEntity userDisabilitiesEntity);
}
