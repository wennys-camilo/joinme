import 'package:dartz/dartz.dart';

import '../domain/helpers/errors/failure.dart';

abstract class GetTokenUsecase {
  Future<Either<Failure, String?>> fetch();
}
