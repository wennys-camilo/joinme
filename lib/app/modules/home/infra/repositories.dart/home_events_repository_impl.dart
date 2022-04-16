import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/event_description_entity.dart';
import '../../domain/repositories/home_events_repository.dart';
import '../datasources/home_events_datasource.dart';

class HomeEventsRepositoryImpl implements HomeEventsRepository {
  final HomeEventsRemoteDataSource _remoteDataSource;

  HomeEventsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<EventDescriptionEntity>>> fetchAll() async {
    try {
      final response = await _remoteDataSource.events();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
