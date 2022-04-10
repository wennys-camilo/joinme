import '../../domain/entities/accessibilities_entities.dart';

abstract class EventsRemoteDatasource {
  Future<List<AccessibilitiesEntity>> accessibilities();
}
