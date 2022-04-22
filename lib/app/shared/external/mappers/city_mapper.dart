import '../../domain/entites/city_entity.dart';

class CityMapper {
  CityEntity to(Map<String, dynamic> map) {
    return CityEntity(name: map['nome']);
  }
}
