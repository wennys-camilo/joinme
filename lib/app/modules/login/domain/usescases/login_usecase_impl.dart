import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/authenticate_entity.dart';
import '../entities/response_auth_entity.dart';

abstract class LoginUsecase {
  Future<Either<Failure, ResponseAuthEntity>> call(AuthenticateEntity userAuth);
}
