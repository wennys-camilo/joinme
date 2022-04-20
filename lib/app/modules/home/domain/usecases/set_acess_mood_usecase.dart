import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class SetAcessMoodUsecase {
  Future<Either<Failure, Unit>> call();
}
