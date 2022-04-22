import 'package:dartz/dartz.dart';
import '../../domain/entites/city_entity.dart';
import '../../domain/helpers/errors/failure.dart';
import '../../domain/repositories/ibge_repository.dart';
import '../datasources/ibge_remote_datasource.dart';

class IbgeRepositoryImpl implements IbgeRepository {
  final IbgeRemoteDataSource _remoteDataSource;

  const IbgeRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<CityEntity>>> fetchCitys() async {
    try {
      final response = await _remoteDataSource.fetch();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
