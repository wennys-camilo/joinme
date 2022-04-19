import 'package:dartz/dartz.dart';
import '../entites/disabilities_enity.dart';
import '../helpers/errors/failure.dart';

abstract class DisabilitiesRepository {
  Future<Either<Failure, List<DisabilitiesEntity>>> fetchList();
}
