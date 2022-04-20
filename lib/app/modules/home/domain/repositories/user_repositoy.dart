import 'package:dartz/dartz.dart';
import '../../../../shared/domain/entites/user_enity.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, Unit>> postMood(id);
  Future<Either<Failure, UserEntity>> fetch();
}
