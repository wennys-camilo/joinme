import '../../domain/entities/accessibilities_entities.dart';
import '../../domain/entities/event_address_entity.dart';
import '../../domain/entities/events_categories_entity.dart';

abstract class EventsRemoteDatasource {
  Future<List<AccessibilitiesEntity>> accessibilities();
  Future<List<EventCategorieEntity>> categories();
  Future<void> create(EventAddressEntity eventAddressEntity);
}
