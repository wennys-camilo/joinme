import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class OnboradingRepository {
  Future<Either<Failure, Unit>> firstAcess(bool value);
  Future<Either<Failure, bool>> check();
}
