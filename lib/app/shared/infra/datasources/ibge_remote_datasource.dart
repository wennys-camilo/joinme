import '../../domain/entites/city_entity.dart';

abstract class IbgeRemoteDataSource {
  Future<List<CityEntity>> fetch();
}
