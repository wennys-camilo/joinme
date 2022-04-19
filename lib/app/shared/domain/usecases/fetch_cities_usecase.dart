import 'package:dartz/dartz.dart';
import '../entites/city_entity.dart';
import '../helpers/errors/failure.dart';

abstract class FetchCitiesUsecase {
  Future<Either<Failure, List<CityEntity>>> call();
}
