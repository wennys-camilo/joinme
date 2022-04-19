import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/user_disabilities_entity.dart';
import '../entities/user_signup_entity.dart';

abstract class SignupRepository {
  Future<Either<Failure, UserSignupEntity>> singup(
      UserSignupEntity userSignupEntity);

  Future<Either<Failure, UserSignupEntity>> update(
      UserSignupEntity userSignupEntity);

  Future<Either<Failure, Unit>> insertDisabilities(
      UserDisabilitiesEntity userDisabilitiesEntity);

  Future<Either<Failure, UserSignupEntity>> updateCity(String city);
}
