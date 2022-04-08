import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/user_signup_entity.dart';

abstract class InsertEmergencyContactUsecase {
  Future<Either<Failure, UserSignupEntity>> call(
      UserSignupEntity userSignupEntit);
}
