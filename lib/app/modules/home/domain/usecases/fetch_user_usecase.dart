import 'package:dartz/dartz.dart';
import '../../../../shared/domain/entites/user_enity.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class FetchUserUsecase {
  Future<Either<Failure, UserEntity>> call();
}
