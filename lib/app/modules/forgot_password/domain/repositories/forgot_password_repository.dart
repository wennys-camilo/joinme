import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class ForgotPasswordRepository {
  Future<Either<Failure, Unit>> reset(String email);
}
