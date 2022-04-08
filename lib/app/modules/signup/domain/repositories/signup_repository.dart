import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/user_signup_entity.dart';

abstract class SignupRepository {
  Future<Either<Failure, UserSignupEntity>> singup(
      UserSignupEntity userSignupEntity);

  Future<Either<Failure, UserSignupEntity>> update(
      UserSignupEntity userSignupEntity);
}
