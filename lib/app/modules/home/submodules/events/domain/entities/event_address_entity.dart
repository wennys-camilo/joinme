import 'address_entity.dart';
import 'event_entity.dart';

class EventAddressEntity {
  final EventEntity event;
  final AddressEntity? address;
  EventAddressEntity({required this.event, this.address});
}
