import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/repositories/forgot_password_repository.dart';
import '../datasources/forgot_password_remote_datasource.dart';

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  final ForgotPasswordRemoteDataSource _remoteDataSource;

  const ForgotPasswordRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Unit>> reset(String email) async {
    try {
      await _remoteDataSource.resetPassword(email);
      return const Right(unit);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
