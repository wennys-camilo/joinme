import 'package:dartz/dartz.dart';
import '../../domain/helpers/errors/failure.dart';
import '../../domain/repositories/token_repository.dart';
import '../datasources/token_local_datasource.dart';

class TokenRepositoryImpl implements TokenRepository {
  final TokenLocalDatasource _localDatasource;

  const TokenRepositoryImpl(this._localDatasource);

  @override
  Future<Either<Failure, String?>> getToken() async {
    try {
      final respose = await _localDatasource.getToken();
      return Right(respose);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, Unit>> setToken(String token) async {
    try {
      await _localDatasource.setToken(token);
      return const Right(unit);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, String?>> getRefreshToken() async {
    try {
      final respose = await _localDatasource.getRefreshToken();
      return Right(respose);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, Unit>> setRefreshToken(String token) async {
    try {
      await _localDatasource.setToken(token);
      return const Right(unit);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
