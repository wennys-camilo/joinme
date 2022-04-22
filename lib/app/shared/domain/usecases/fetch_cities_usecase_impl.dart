import 'package:dartz/dartz.dart';
import '../entites/city_entity.dart';
import '../helpers/errors/failure.dart';
import '../repositories/ibge_repository.dart';
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
