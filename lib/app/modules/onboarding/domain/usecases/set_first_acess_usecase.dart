import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

abstract class SetFirstAcessUsecase {
  Future<Either<Failure, void>> call(bool value);
}
