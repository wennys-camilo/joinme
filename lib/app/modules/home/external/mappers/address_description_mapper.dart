import '../../domain/entities/address_description_entity.dart';

class AddressDescriptionMapper {
  AddressDescriptionEntity to(Map<String, dynamic> map) {
    return AddressDescriptionEntity(
      id: map['id'] ?? '',
      street: map['street'] ?? '',
      number: map['number']?.toInt() ?? 0,
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      zipCode: map['zipCode'] ?? '',
      referencePoint: map['referencePoint'] ?? '',
      userId: map['userId'] ?? '',
      eventId: map['eventId'] ?? '',
    );
  }
}
