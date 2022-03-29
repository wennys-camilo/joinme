import 'package:camp_final/app/modules/login/domain/entities/authenticate_entity.dart';
import 'package:camp_final/app/modules/login/domain/repositories/login_repository.dart';
import 'package:camp_final/app/modules/login/domain/usescases/login_usecase_impl.dart';
import 'package:camp_final/app/modules/login/domain/entities/response_auth_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

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
