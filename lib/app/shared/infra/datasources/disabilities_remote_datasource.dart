import '../../domain/entites/disabilities_enity.dart';

abstract class DisabilitiesRemoteDatasource {
  Future<List<DisabilitiesEntity>> fetch();
}
