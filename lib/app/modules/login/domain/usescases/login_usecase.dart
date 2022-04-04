import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/authenticate_entity.dart';
import '../entities/response_auth_entity.dart';
import '../repositories/login_repository.dart';
import 'login_usecase_impl.dart';

class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository _repository;

  const LoginUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, ResponseAuthEntity>> call(
      AuthenticateEntity userAuth) async {
    final result = await _repository.signin(userAuth);
    return result;
  }
}
