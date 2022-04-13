import 'address_mapper.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/entities/event_entity.dart';
import 'event_mapper.dart';

class EventAddressMapper {
  Map<String, dynamic> to(
      {required EventEntity event, AddressEntity? address}) {
    if (address != null) {
      return {
        'event': EventMapper().to(event),
        'address': AddressMapper().to(address)
      };
    } else {
      return {'event': EventMapper().to(event)};
    }
  }
}
