import 'package:camp_final/app/shared/domain/helpers/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SetTokenUsecase {
  Future<Either<Failure, Unit>> call(String token);
}
