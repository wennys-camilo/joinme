import 'package:camp_final/app/shared/domain/helpers/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../entites/city_entity.dart';

abstract class IbgeRepository {
  Future<Either<Failure, List<CityEntity>>> fetchCitys();
}
