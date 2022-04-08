import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/user_signup_entity.dart';
import '../../domain/repositories/signup_repository.dart';
import '../datasources/signup_remote_datasource.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupRemoteDatasource _remoteDatasource;
  SignupRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, UserSignupEntity>> singup(
      UserSignupEntity userSignupEntity) async {
    try {
      final response = await _remoteDatasource.signup(userSignupEntity);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, UserSignupEntity>> update(
      UserSignupEntity userSignupEntity) async {
    try {
      final response = await _remoteDatasource.update(userSignupEntity);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
