import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/authenticate_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_datasource.dart';
import '../../domain/entities/response_auth_entity.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDatasource _remoteDatasource;

  const LoginRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, ResponseAuthEntity>> signin(
      AuthenticateEntity userAuth) async {
    try {
      final response = await _remoteDatasource.signin(userAuth: userAuth);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
