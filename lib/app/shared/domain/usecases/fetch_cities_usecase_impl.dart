import 'package:camp_final/app/shared/domain/entites/city_entity.dart';
import 'package:camp_final/app/shared/domain/helpers/errors/failure.dart';
import 'package:camp_final/app/shared/domain/repositories/ibge_repository.dart';
import 'package:dartz/dartz.dart';

import 'fetch_cities_usecase.dart';

class FetchCitiesIbgeUsecaseImpl implements FetchCitiesUsecase {
  final IbgeRepository _repository;

  const FetchCitiesIbgeUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<CityEntity>>> call() async {
    final result = await _repository.fetchCitys();
    return result;
  }
}
