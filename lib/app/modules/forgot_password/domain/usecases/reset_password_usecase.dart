import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class ResetPasswordUsecase {
  Future<Either<Failure, Unit>> call(String email);
}
