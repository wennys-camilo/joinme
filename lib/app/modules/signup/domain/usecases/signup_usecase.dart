import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/user_signup_entity.dart';
import '../repositories/signup_repository.dart';
import 'signup_usecase_impl.dart';

class SignupUsecaseImpl implements SignupUsecase {
  final SignupRepository _repository;

  const SignupUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> singup(
      UserSignupEntity userSignupEntity) async {
    final result = await _repository.singup(userSignupEntity);
    return result;
  }
}
