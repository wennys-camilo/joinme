class AddressEntity {
  final String? street;
  final int? number;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? referencePoint;

  AddressEntity({
    required this.street,
    required this.number,
    required this.city,
    required this.state,
    required this.zipCode,
    this.referencePoint,
  });
}
