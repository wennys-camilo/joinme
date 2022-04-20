import 'package:dartz/dartz.dart';

import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class HomeLocalRepository {
  Future<Either<Failure, Unit>> setAcess();
  Future<Either<Failure, bool>> check();
}
