import '../../domain/entities/address_entity.dart';

class AddressMapper {
  Map<String, dynamic> to(AddressEntity? address) {
    return {
      'street': address?.street,
      'number': address?.number,
      'city': address?.city,
      'state': address?.state,
      'zipCode': address?.zipCode,
      'referencePoint': address?.referencePoint,
    };
  }
}
