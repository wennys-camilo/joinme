import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class VerifyShowMoodUsecase {
  Future<Either<Failure, bool>> call();
}
