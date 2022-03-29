import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/authenticate_entity.dart';
import '../entities/response_auth_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, ResponseAuthEntity>> signin(
      AuthenticateEntity userAuth);
}
