import 'package:camp_final/app/shared/domain/helpers/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class GetTokenUsecase {
  Future<Either<Failure, String?>> fetch();
}
