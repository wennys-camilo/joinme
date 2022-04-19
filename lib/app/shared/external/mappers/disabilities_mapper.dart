import '../../domain/entites/disabilities_enity.dart';

class DisabilitiesMapper {
  DisabilitiesEntity to(Map<String, dynamic> map) {
    return DisabilitiesEntity(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }
}
