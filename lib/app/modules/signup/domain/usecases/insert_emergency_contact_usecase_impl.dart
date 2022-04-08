import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/user_signup_entity.dart';
import '../repositories/signup_repository.dart';
import 'insert_emergency_contact_usecase.dart';

class InsertEmergencyContactUsecaseImpl
    implements InsertEmergencyContactUsecase {
  final SignupRepository _repository;

  InsertEmergencyContactUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, UserSignupEntity>> call(
      UserSignupEntity userSignupEntit) async {
    final result = await _repository.update(userSignupEntit);
    return result;
  }
}
