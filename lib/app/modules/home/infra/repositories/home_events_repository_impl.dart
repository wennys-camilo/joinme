import 'package:camp_final/app/modules/home/domain/entities/attendees_entity.dart';
import 'package:camp_final/app/modules/home/domain/entities/attendees_response_entity.dart';
import 'package:camp_final/app/modules/home/domain/entities/mood_entity.dart';
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

  @override
  Future<Either<Failure, AttendeesReponseEntity>> attendeesEvents(
      AttendeesEntity entity) async {
    try {
      final response = await _remoteDataSource.setAttendees(entity);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<AttendeesReponseEntity>>> status(
      String type) async {
    try {
      final response = await _remoteDataSource.getStatusList(type);
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<MoodEntity>>> getMoodsHome() async {
    try {
      final response = await _remoteDataSource.getMoods();
      return Right(response);
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
