import 'package:dartz/dartz.dart';

import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class PostMoodUserUsecase {
  Future<Either<Failure, Unit>> call(String id);
}
