import 'package:dartz/dartz.dart';
import '../../../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/accessibilities_entities.dart';
import '../../domain/entities/event_address_entity.dart';
import '../../domain/entities/events_categories_entity.dart';
import '../../domain/repositories/events_repository.dart';
import '../datasources/events_remote_datasource.dart';

class EventsRepositoryImpl implements EventsRepository {
  final EventsRemoteDatasource _eventsRemoteDatasource;
  EventsRepositoryImpl(this._eventsRemoteDatasource);

  @override
  Future<Either<Failure, List<AccessibilitiesEntity>>>
      accessibilitiesEvent() async {
    try {
      final response = await _eventsRemoteDatasource.accessibilities();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<EventCategorieEntity>>> categoriesEvent() async {
    try {
      final response = await _eventsRemoteDatasource.categories();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, Unit>> create(
      EventAddressEntity eventAddressEntity) async {
    try {
      await _eventsRemoteDatasource.create(eventAddressEntity);
      return const Right(unit);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
