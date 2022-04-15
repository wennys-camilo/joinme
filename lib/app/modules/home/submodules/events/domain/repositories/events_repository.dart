import 'package:dartz/dartz.dart';
import '../../../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/accessibilities_entities.dart';
import '../entities/event_address_entity.dart';
import '../entities/events_categories_entity.dart';

abstract class EventsRepository {
  Future<Either<Failure, List<AccessibilitiesEntity>>> accessibilitiesEvent();
  Future<Either<Failure, List<EventCategorieEntity>>> categoriesEvent();
  Future<Either<Failure, Unit>> create(EventAddressEntity eventAddressEntity);
}
