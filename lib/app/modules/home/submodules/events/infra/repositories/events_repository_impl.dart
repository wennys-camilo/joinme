import 'package:camp_final/app/modules/home/submodules/events/domain/entities/accessibilities_entities.dart';
import 'package:camp_final/app/modules/home/submodules/events/infra/datasources/events_remote_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/repositories/events_repository.dart';

class EveventsRepositoryImpl implements EveventsRepository {
  final EventsRemoteDatasource _eventsRemoteDatasource;
  EveventsRepositoryImpl(this._eventsRemoteDatasource);

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
}
