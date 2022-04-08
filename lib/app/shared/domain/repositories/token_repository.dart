import '../helpers/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class TokenRepository {
  Future<Either<Failure, String?>> getToken();
  Future<Either<Failure, Unit>> setToken(String token);
  Future<Either<Failure, String?>> getRefreshToken();
  Future<Either<Failure, Unit>> setRefreshToken(String token);
}
