import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../repositories/forgot_password_repository.dart';
import 'reset_password_usecase.dart';

class ResetPasswordUsecaseImpl implements ResetPasswordUsecase {
  final ForgotPasswordRepository _repository;

  const ResetPasswordUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call(String email) async {
    final result = await _repository.reset(email);
    return result;
  }
}
