class AddressDescriptionEntity {
  final String id;
  final String street;
  final int number;
  final String city;
  final String state;
  final String zipCode;
  final String referencePoint;
  final String userId;
  final String eventId;

  AddressDescriptionEntity({
    required this.id,
    required this.street,
    required this.number,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.referencePoint,
    required this.userId,
    required this.eventId,
  });
}
